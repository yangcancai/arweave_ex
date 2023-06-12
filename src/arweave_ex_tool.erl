%%%-------------------------------------------------------------------
%%% @author cam
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 6月 2023 20:45
%%%-------------------------------------------------------------------
-module(arweave_ex_tool).
-author("cam").

-include_lib("arweave/include/ar.hrl").
-include_lib("arweave/include/ar_config.hrl").
-export([init/0, balances/0, balance/1]).

balances() ->
	{ok, Config} = application:get_env(arweave, config),
	WalletsDir =  filename:join(Config#config.data_dir, "wallets"),
	{ok, Entries} = file:list_dir_all(WalletsDir),
	lists:map(
		fun	(File) ->
			  Addr = ar_wallet:to_address(ar_wallet:load_keyfile(filename:join(WalletsDir, File))),
				balance(Addr)
		end,
		Entries
	).

balance(Addr) ->
	ar_wallets:get_balance(Addr).

%% API
init() ->
	application:set_env(arweave, config, #config{data_dir = "./data_localtest",port = 1984}),
	clear(),
	%% This wallet is never spent from or deposited to, so the balance is predictable
	Pub1 = ar_wallet:new_keyfile(),
	Pub2 = ar_wallet:new_keyfile(),
	Pub3 = ar_wallet:new_keyfile(),
	[B0] = ar_weave:init([
		{ar_wallet:to_address(Pub1), ?AR(10000), <<>>},
		{ar_wallet:to_address(Pub2), ?AR(10000), <<>>},
		{ar_wallet:to_address(Pub3), ?AR(10), <<"TEST_ID">>}
	], 1),%% Set difficulty to 0 to speed up tests
	start(B0),
	{Pub1, Pub2, Pub3, B0}.
clear() ->
	{ok, Config} = application:get_env(arweave, config),
	{ok, Entries} = file:list_dir_all(Config#config.data_dir),
	lists:foreach(
		fun	("wallets") ->
				ok;
			(Entry) ->
				file:del_dir_r(filename:join(Config#config.data_dir, Entry))
		end,
		Entries
	).
%% @doc Start a fresh master node with the given genesis block.
start(B0) ->
	start(B0, ar_wallet:to_address(ar_wallet:new_keyfile()),
			element(2, application:get_env(arweave, config))).

%% @doc Start a fresh master node with the given genesis block, mining address, and config.
start(B0, RewardAddr, Config) ->
	%% Configure the storage modules to cover 200 MiB of the weave.
	StorageModules = lists:flatten([[{20 * 1024 * 1024, N, {spora_2_6, RewardAddr}},
			{20 * 1024 * 1024, N, spora_2_5}] || N <- lists:seq(0, 8)]),
	start(B0, RewardAddr, Config, StorageModules).

%% @doc Start a fresh master node with the given genesis block, mining address, config,
%% and storage modules.
start(B0, RewardAddr, Config, StorageModules) ->
	write_genesis_files(Config#config.data_dir, B0),
	ok = application:set_env(arweave, config, Config#config{
		start_from_block_index = true,
		auto_join = true,
		peers = [],
		mining_addr = RewardAddr,
		storage_modules = StorageModules,
		disk_space_check_frequency = 1000,
		sync_jobs = 2,
		packing_rate = 20,
		disk_pool_jobs = 2,
		header_sync_jobs = 2,
		enable = [search_in_rocksdb_when_mining, serve_tx_data_without_limits,
				double_check_nonce_limiter, legacy_storage_repacking, serve_wallet_lists,
				pack_served_chunks | Config#config.enable],
		mining_server_chunk_cache_size_limit = 4
	}),
	{ok, _} = application:ensure_all_started(arweave, permanent),
	wait_until_joined(),
	wait_until_syncs_genesis_data(),
	{whereis(ar_node_worker), B0}.

wait_until_joined() ->
	ar_util:do_until(
		fun() -> ar_node:is_joined() end,
		100,
		60 * 1000
	 ).

wait_until_syncs_genesis_data() ->
	WeaveSize = (ar_node:get_current_block())#block.weave_size,
	wait_until_syncs_genesis_data(0, WeaveSize, any),
	%% Once the data is stored in the disk pool, make the storage modules
	%% copy the missing data over from each other. This procedure is executed on startup
	%% but the disk pool did not have any data at the time.
	{ok, Config} = application:get_env(arweave, config),
	[gen_server:cast(list_to_atom("ar_data_sync_" ++ ar_storage_module:id(Module)),
			sync_data) || Module <- Config#config.storage_modules],
	wait_until_syncs_genesis_data(0, WeaveSize, spora_2_5),
	wait_until_syncs_genesis_data(0, WeaveSize, {spora_2_6, Config#config.mining_addr}).

wait_until_syncs_genesis_data(Offset, WeaveSize, _Packing) when Offset >= WeaveSize ->
	ok;
wait_until_syncs_genesis_data(Offset, WeaveSize, Packing) ->
	true = ar_util:do_until(
		fun() ->
			case Packing of
				any ->
					case ar_sync_record:is_recorded(Offset + 1, ar_data_sync) of
						false ->
							false;
						_ ->
							true
					end;
				_ ->
					case ar_sync_record:is_recorded(Offset + 1, {ar_data_sync, Packing}) of
						{{true, _}, _} ->
							true;
						_ ->
							false
					end
			end
		end,
		200,
		1000
	),
	wait_until_syncs_genesis_data(Offset + ?DATA_CHUNK_SIZE, WeaveSize, Packing).

write_genesis_files(DataDir, B0) ->
	BH = B0#block.indep_hash,
	BlockDir = filename:join(DataDir, ?BLOCK_DIR),
	ok = filelib:ensure_dir(BlockDir ++ "/"),
	BlockFilepath = filename:join(BlockDir, binary_to_list(ar_util:encode(BH)) ++ ".bin"),
	ok = file:write_file(BlockFilepath, ar_serialize:block_to_binary(B0)),
	TXDir = filename:join(DataDir, ?TX_DIR),
	ok = filelib:ensure_dir(TXDir ++ "/"),
	lists:foreach(
		fun(TX) ->
			TXID = TX#tx.id,
			TXFilepath = filename:join(TXDir, binary_to_list(ar_util:encode(TXID)) ++ ".json"),
			TXJSON = ar_serialize:jsonify(ar_serialize:tx_to_json_struct(TX)),
			ok = file:write_file(TXFilepath, TXJSON)
		end,
		B0#block.txs
	),
	BI = [ar_util:block_index_entry_from_block(B0)],
	BIBin = term_to_binary({BI, B0#block.reward_history}),
	HashListDir = filename:join(DataDir, ?HASH_LIST_DIR),
	ok = filelib:ensure_dir(HashListDir ++ "/"),
	BIFilepath = filename:join(HashListDir, <<"last_block_index_and_reward_history.bin">>),
	ok = file:write_file(BIFilepath, BIBin),
	WalletListDir = filename:join(DataDir, ?WALLET_LIST_DIR),
	ok = filelib:ensure_dir(WalletListDir ++ "/"),
	RootHash = B0#block.wallet_list,
	WalletListFilepath =
		filename:join(WalletListDir, binary_to_list(ar_util:encode(RootHash)) ++ ".json"),
	WalletListJSON =
		ar_serialize:jsonify(
			ar_serialize:wallet_list_to_json_struct(B0#block.reward_addr, false,
					B0#block.account_tree)
		),
	ok = file:write_file(WalletListFilepath, WalletListJSON).
