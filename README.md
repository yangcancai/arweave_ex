# ArweaveEx

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
## First, Setup 
```shell
$ sh tool.sh setup
```

## Start testnet node
```shell
➜  arweave_ex git:(main) ✗ sh tool.sh testnet        
make: `/Users/xx/proj/elixir/arweave_ex/arweave/apps/ar_sqlite3/c_src/../priv/ar_sqlite3_driver' is up to date.
===> Analyzing applications...
===> Compiling ar_sqlite3
===> Analyzing applications...
===> Compiling arweave
apps/arweave/src/ar_block_cache.erl:562:2: Warning: variable 'GetStart' is unused
apps/arweave/src/ar_block_cache.erl:851:1: Warning: function random_block_with_txs/2 is unused

apps/arweave/src/ar_peers.erl:92:1: Warning: function resolve_peers/1 is unused

apps/arweave/src/ar_data_discovery.erl:207:37: Warning: the result of calling length/1 is ignored (suppress the warning by assigning the expression to the _ variable)

Erlang/OTP 24 [erts-12.2.1] [source] [64-bit] [smp:8:8] [ds:8:8:20] [async-threads:20] [jit]

make: `/Users/xx/proj/elixir/arweave_ex/arweave/apps/ar_sqlite3/c_src/../priv/ar_sqlite3_driver' is up to date.
===> Analyzing applications...
===> Compiling ar_sqlite3
===> Analyzing applications...
===> Compiling arweave
[info] Running ArweaveExWeb.Endpoint with cowboy 2.9.0 at 127.0.0.1:4000 (http)
[info] Access ArweaveExWeb.Endpoint at http://localhost:4000
main = ["disable","randomx_jit","peer","testnet-1.arweave.net","peer",
"testnet-2.arweave.net","peer","testnet-3.arweave.net"][watch] build finished, watching for changes...

****************************************
Launching with config:
init: false
port: 1984
mine: false
peers: ["95.216.19.227:1984","5.9.18.85:1984","148.251.135.52:1984"]
block_gossip_peers: []
local_peers: []
sync_from_local_peers_only: false
data_dir: "."
log_dir: "logs"
metrics_dir: "metrics"
polling: 2
block_pollers: 10
auto_join: true
join_workers: 10
diff: 6
mining_addr: not_set
max_miners: 0
io_threads: 10
stage_one_hashing_threads: 4
stage_two_hashing_threads: 6
hashing_threads: 7
mining_server_chunk_cache_size_limit: undefined
packing_cache_size_limit: undefined
data_cache_size_limit: undefined
tx_validators: undefined
post_tx_timeout: 20
max_emitters: 16
tx_propagation_parallelization: undefined
sync_jobs: 100
header_sync_jobs: 1
disk_pool_jobs: 20
load_key: not_set
disk_space: undefined
disk_space_check_frequency: 30000
storage_modules: []
start_from_block_index: false
internal_api_secret: not_set
enable: []
disable: [randomx_jit]
transaction_blacklist_files: []
transaction_blacklist_urls: []
transaction_whitelist_files: []
transaction_whitelist_urls: []
gateway_domain: not_set
gateway_custom_domains: []
requests_per_minute_limit: 900
requests_per_minute_limit_by_ip: #{}
max_propagation_peers: 16
max_block_propagation_peers: 1000
ipfs_pin: false
webhooks: []
max_connections: 1024
max_gateway_connections: 128
max_poa_option_depth: 500
disk_pool_data_root_expiration_time: 1800
max_disk_pool_buffer_mb: 100000
max_disk_pool_data_root_buffer_mb: 10000
randomx_bulk_hashing_iterations: 8
semaphores: #{arql => 10,gateway_arql => infinity,get_and_pack_chunk => 1,
get_block_index => 1,get_chunk => 100,get_sync_record => 10,
get_tx_data => 1,get_wallet_list => 1,post_chunk => 100,
post_tx => 20}
disk_cache_size: 5120
packing_rate: undefined
max_nonce_limiter_validation_thread_count: 4
max_nonce_limiter_last_step_validation_thread_count: 7
nonce_limiter_server_trusted_peers: []
nonce_limiter_client_peers: []
debug: false
repair_rocksdb: []
run_defragmentation: false
defragmentation_trigger_threshold: 1500000000
defragmentation_modules: []
block_throttle_by_ip_interval: 1000
block_throttle_by_solution_interval: 2000
****************************************
Browserslist: caniuse-lite is outdated. Please run:
npx update-browserslist-db@latest
Why you should do it regularly: https://github.com/browserslist/update-db#readme

Rebuilding...

Done in 303ms.


VDF step computed in 5.19 seconds.

WARNING: your VDF computation speed is low - consider fetching VDF outputs from an external source (see vdf_server_trusted_peer and vdf_client_peer command line parameters).

[notice]     :alarm_handler: {:set, {:system_memory_high_watermark, []}}
[notice]     :alarm_handler: {:set, {{:disk_almost_full, '/System/Volumes/Data'}, []}}

Setting the mining address to ssR0o--9-MhY8px7wUw4Qx-gt9b4kq9HxKXlFWkReI0.
[info] [ar_arql_db: :init, data_dir: '.']
dets: file "./ar_tx_blacklist/ar_tx_blacklist" not properly closed, repairing ...
dets: file "./ar_tx_blacklist/ar_tx_blacklist_pending_headers" not properly closed, repairing ...
dets: file "./ar_tx_blacklist/ar_tx_blacklist_pending_data" not properly closed, repairing ...
dets: file "./ar_tx_blacklist/ar_tx_blacklist_offsets" not properly closed, repairing ...
dets: file "./ar_tx_blacklist/ar_tx_blacklist_pending_restore_headers" not properly closed, repairing ...

Initialising RandomX dataset for fast packing. Key: <<"ZGVmYXVsdCBhcndlYXZlIDIuNSBwYWNrIGtleQ">>. The process may take several minutes.
RandomX dataset initialisation complete.

The node is configured to pack around 10 chunks per second. To increase the packing rate, start with `packing_rate [number]`. Estimated maximum rate: 7.65 chunks/s.

Setting the packing chunk cache size limit to 100 chunks.
[info] [event: :ar_header_sync_start]

Sync request latency target is: 10000ms.
[info] [event: :ar_data_sync_start, store_id: 'default']

Setting the data chunk cache size limit to 100 chunks.
[info] [event: :started_io_mining_thread, partition_number: 39, mining_addr: "ssR0o--9-MhY8px7wUw4Qx-gt9b4kq9HxKXlFWkReI0", store_id: 'default']
Joining the Arweave network...
[info] [event: :ar_blacklist_middleware_start]
Interactive Elixir (1.14.3) - press Ctrl+C to exit (type h() ENTER for help)

The node has stopped syncing data into the storage module default due to the insufficient disk space.

The node has stopped syncing headers. Add more disk space if you wish to store more block and transaction headers. The node will keep recording account tree updates and transaction confirmations - they do not take up a lot of space but you need to make sure the remaining disk space stays available for the node.

The mining performance is not affected.
[info] [event: :ar_header_sync_stopped_syncing, reason: :insufficient_disk_space]
[info] [event: :storage_module_stopped_syncing, reason: :insufficient_disk_space, storage_module: 'default']
kk
iex(1)>
nil
iex(2)>
nil
iex(3)>
nil
iex(4)>
nil
iex(5)> Downloaded the block index successfully.
Downloading joining block I8x0eMXrqGCY1V_VQ0VbtuA4_pW6n0Ll5XAOHY2Vlq-1kmgDh78Bsc55eeXX4F2J.
Downloading the block trail.
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 99]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 98]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 97]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 96]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 95]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 94]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 93]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 92]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 91]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 90]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 89]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 88]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 87]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 86]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 85]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 84]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 83]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 82]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 81]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 80]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 79]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 78]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 77]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 76]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 75]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 74]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 73]

nil
iex(6)> [info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 72]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 71]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 70]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 69]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 68]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 67]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 66]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 65]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 64]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 63]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 62]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 61]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 60]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 59]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 58]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 57]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 56]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 55]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 54]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 53]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 52]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 51]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 50]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 49]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 48]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 47]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 46]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 45]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 44]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 43]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 42]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 41]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 40]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 39]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 38]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 37]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 36]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 35]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 34]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 33]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 32]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 31]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 30]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 29]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 28]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 27]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 26]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 25]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 24]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 23]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 22]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 21]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 20]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 19]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 18]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 17]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 16]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 15]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 14]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 13]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 12]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 11]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 10]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 9]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 8]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 7]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 6]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 5]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 4]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 3]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 2]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 1]
[info] [event: :join_remaining_blocks_to_fetch, remaining_blocks_count: 0]
Downloaded the block trail successfully.
Downloading the wallet tree, chunk 1.
Downloading the wallet tree, chunk 2.
Downloading the wallet tree, chunk 3.
Downloading the wallet tree, chunk 4.
Downloading the wallet tree, chunk 5.
Downloading the wallet tree, chunk 6.
Downloading the wallet tree, chunk 7.
Downloading the wallet tree, chunk 8.
Downloading the wallet tree, chunk 9.
Downloading the wallet tree, chunk 10.
Downloading the wallet tree, chunk 11.
Downloading the wallet tree, chunk 12.
Downloading the wallet tree, chunk 13.
Downloading the wallet tree, chunk 14.
Downloading the wallet tree, chunk 15.
Downloading the wallet tree, chunk 16.
Downloading the wallet tree, chunk 17.
Downloading the wallet tree, chunk 18.
Downloading the wallet tree, chunk 19.
Downloading the wallet tree, chunk 20.
Downloading the wallet tree, chunk 21.
Downloading the wallet tree, chunk 22.
Downloading the wallet tree, chunk 23.
Downloading the wallet tree, chunk 24.
Downloading the wallet tree, chunk 25.
Downloading the wallet tree, chunk 26.
Downloading the wallet tree, chunk 27.
Downloading the wallet tree, chunk 28.
Downloading the wallet tree, chunk 29.
Downloading the wallet tree, chunk 30.
Downloading the wallet tree, chunk 31.
Downloading the wallet tree, chunk 32.
Downloading the wallet tree, chunk 33.
Downloading the wallet tree, chunk 34.
Downloading the wallet tree, chunk 35.
Downloading the wallet tree, chunk 36.
Downloading the wallet tree, chunk 37.
Downloading the wallet tree, chunk 38.
Downloading the wallet tree, chunk 39.
Downloading the wallet tree, chunk 40.
Downloading the wallet tree, chunk 41.
Downloading the wallet tree, chunk 42.
Downloading the wallet tree, chunk 43.
Downloading the wallet tree, chunk 44.
Downloading the wallet tree, chunk 45.
Downloading the wallet tree, chunk 46.
Downloading the wallet tree, chunk 47.
Downloading the wallet tree, chunk 48.
Downloading the wallet tree, chunk 49.
Downloading the wallet tree, chunk 50.
Downloading the wallet tree, chunk 51.
Downloading the wallet tree, chunk 52.
Downloading the wallet tree, chunk 53.
Downloading the wallet tree, chunk 54.
Downloading the wallet tree, chunk 55.
Downloading the wallet tree, chunk 56.
Downloading the wallet tree, chunk 57.
Downloading the wallet tree, chunk 58.
Downloaded the wallet tree successfully.
[info] [event: :storing_account_tree_update, updated_key_count: 187810, height: 1191256, root_hash: "WhqbT6LxsLPimJgnwsiRnjk5TZt1ldurR0myOIQqiJ84LH3XpILhxgY8h_TTc07Y"]
Joined the Arweave network successfully.
[info] [event: :joined_the_network]
[info] [event: :fetched_block_for_validation, block: "xJ-9GbfZ-mXAEEgKdxX8P1-hLX3yBhn2doL24pcaDv7jDiRZSQJdob88cUkoV1k5", peer: '95.216.19.227:1984']
[info] [event: :fetched_block_for_validation, block: "xJ-9GbfZ-mXAEEgKdxX8P1-hLX3yBhn2doL24pcaDv7jDiRZSQJdob88cUkoV1k5", peer: '148.251.135.52:1984']
[info] [event: :processing_block, peer: '95.216.19.227:1984', height: 1191306, step_number: 8045913, block: "xJ-9GbfZ-mXAEEgKdxX8P1-hLX3yBhn2doL24pcaDv7jDiRZSQJdob88cUkoV1k5", miner_address: "HnjnoDf25mJroiFgY3FJLYw3EsUtcF9LDcJYMI3gKZs", previous_block: "I8x0eMXrqGCY1V_VQ0VbtuA4_pW6n0Ll5XAOHY2Vlq-1kmgDh78Bsc55eeXX4F2J"]
[info] [event: :stored_account_tree]
[info] [event: :storing_account_tree_update, updated_key_count: 4, height: 1191305, root_hash: "XtqTEH0udu7u4AwVhzEfDnfWdK_8QJje8KZcx3FD_mc8x79x35ZcTgc5Yzr3370k"]
[info] [event: :stored_account_tree]
[info] [event: :accepted_block, height: 1191306, indep_hash: "xJ-9GbfZ-mXAEEgKdxX8P1-hLX3yBhn2doL24pcaDv7jDiRZSQJdob88cUkoV1k5"]
[info] [event: :processing_block, peer: '148.251.135.52:1984', height: 1191306, step_number: 8045913, block: "xJ-9GbfZ-mXAEEgKdxX8P1-hLX3yBhn2doL24pcaDv7jDiRZSQJdob88cUkoV1k5", miner_address: "HnjnoDf25mJroiFgY3FJLYw3EsUtcF9LDcJYMI3gKZs", previous_block: "I8x0eMXrqGCY1V_VQ0VbtuA4_pW6n0Ll5XAOHY2Vlq-1kmgDh78Bsc55eeXX4F2J"]
[info] [event: :vdf_validation_start, block: "xJ-9GbfZ-mXAEEgKdxX8P1-hLX3yBhn2doL24pcaDv7jDiRZSQJdob88cUkoV1k5", session_key: "Rx514yjJCbfmcW2eeD3gCsWm7FxmFOqP-Djm18boKzZQReztvjzsH2qNEZpaXNnK", next_session_key: "Rx514yjJCbfmcW2eeD3gCsWm7FxmFOqP-Djm18boKzZQReztvjzsH2qNEZpaXNnK", start_step_number: 8045795, step_number: 8045913, step_count: 118, steps: 118, session_steps: 14, pid: #PID<0.997.0>]
[info] [event: :fetched_block_for_validation, block: "89sl2AW6nt6KrSBkk_v7Pacqlfs7ukK7QLktozzgVrNFN619p6dhoSBCBcqy9xpH", peer: '5.9.18.85:1984']
[info] [event: :accepted_block, height: 1191306, indep_hash: "xJ-9GbfZ-mXAEEgKdxX8P1-hLX3yBhn2doL24pcaDv7jDiRZSQJdob88cUkoV1k5"]
[info] [event: :processing_block, peer: '5.9.18.85:1984', height: 1191307, step_number: 8045930, block: "89sl2AW6nt6KrSBkk_v7Pacqlfs7ukK7QLktozzgVrNFN619p6dhoSBCBcqy9xpH", miner_address: "HnjnoDf25mJroiFgY3FJLYw3EsUtcF9LDcJYMI3gKZs", previous_block: "xJ-9GbfZ-mXAEEgKdxX8P1-hLX3yBhn2doL24pcaDv7jDiRZSQJdob88cUkoV1k5"]
[info] [event: :fetched_block_for_validation, block: "89sl2AW6nt6KrSBkk_v7Pacqlfs7ukK7QLktozzgVrNFN619p6dhoSBCBcqy9xpH", peer: '148.251.135.52:1984']

nil
iex(7)> [info] [event: :fetched_block_for_validation, block: "89sl2AW6nt6KrSBkk_v7Pacqlfs7ukK7QLktozzgVrNFN619p6dhoSBCBcqy9xpH", peer: '148.251.135.52:1984']
[info] [event: :accepted_block, height: 1191307, indep_hash: "89sl2AW6nt6KrSBkk_v7Pacqlfs7ukK7QLktozzgVrNFN619p6dhoSBCBcqy9xpH"]
[info] [event: :processing_block, peer: '148.251.135.52:1984', height: 1191307, step_number: 8045930, block: "89sl2AW6nt6KrSBkk_v7Pacqlfs7ukK7QLktozzgVrNFN619p6dhoSBCBcqy9xpH", miner_address: "HnjnoDf25mJroiFgY3FJLYw3EsUtcF9LDcJYMI3gKZs", previous_block: "xJ-9GbfZ-mXAEEgKdxX8P1-hLX3yBhn2doL24pcaDv7jDiRZSQJdob88cUkoV1k5"]
[info] [event: :fetched_block_for_validation, block: "c52nZ6votUlnRR-5rc_ypYrKP-MXjURYdznoqp0U1tlayyCI9wAvuzK-7Znr_K8F", peer: '148.251.135.52:1984']
[info] [event: :accepted_block, height: 1191307, indep_hash: "89sl2AW6nt6KrSBkk_v7Pacqlfs7ukK7QLktozzgVrNFN619p6dhoSBCBcqy9xpH"]
[info] [event: :processing_block, peer: '148.251.135.52:1984', height: 1191308, step_number: 8046038, block: "c52nZ6votUlnRR-5rc_ypYrKP-MXjURYdznoqp0U1tlayyCI9wAvuzK-7Znr_K8F", miner_address: "HnjnoDf25mJroiFgY3FJLYw3EsUtcF9LDcJYMI3gKZs", previous_block: "89sl2AW6nt6KrSBkk_v7Pacqlfs7ukK7QLktozzgVrNFN619p6dhoSBCBcqy9xpH"]
[info] [event: :fetched_block_for_validation, block: "c52nZ6votUlnRR-5rc_ypYrKP-MXjURYdznoqp0U1tlayyCI9wAvuzK-7Znr_K8F", peer: '5.9.18.85:1984']
[info] [event: :accepted_block, height: 1191308, indep_hash: "c52nZ6votUlnRR-5rc_ypYrKP-MXjURYdznoqp0U1tlayyCI9wAvuzK-7Znr_K8F"]
[info] [event: :processing_block, peer: '5.9.18.85:1984', height: 1191308, step_number: 8046038, block: "c52nZ6votUlnRR-5rc_ypYrKP-MXjURYdznoqp0U1tlayyCI9wAvuzK-7Znr_K8F", miner_address: "HnjnoDf25mJroiFgY3FJLYw3EsUtcF9LDcJYMI3gKZs", previous_block: "89sl2AW6nt6KrSBkk_v7Pacqlfs7ukK7QLktozzgVrNFN619p6dhoSBCBcqy9xpH"]
[info] [event: :fetched_block_for_validation, block: "Qj1UA61EnIJbjUkvsGGjFcXf2CH60pCRdUXDEZ0e7VyHRgtQJM80Gbwe9RZ5nUw9", peer: '148.251.135.52:1984']
[info] [event: :accepted_block, height: 1191308, indep_hash: "c52nZ6votUlnRR-5rc_ypYrKP-MXjURYdznoqp0U1tlayyCI9wAvuzK-7Znr_K8F"]
[info] [event: :processing_block, peer: '148.251.135.52:1984', height: 1191309, step_number: 8046168, block: "Qj1UA61EnIJbjUkvsGGjFcXf2CH60pCRdUXDEZ0e7VyHRgtQJM80Gbwe9RZ5nUw9", miner_address: "HnjnoDf25mJroiFgY3FJLYw3EsUtcF9LDcJYMI3gKZs", previous_block: "c52nZ6votUlnRR-5rc_ypYrKP-MXjURYdznoqp0U1tlayyCI9wAvuzK-7Znr_K8F"]
[info] [event: :fetched_block_for_validation, block: "Qj1UA61EnIJbjUkvsGGjFcXf2CH60pCRdUXDEZ0e7VyHRgtQJM80Gbwe9RZ5nUw9", peer: '5.9.18.85:1984']
[info] [event: :accepted_block, height: 1191309, indep_hash: "Qj1UA61EnIJbjUkvsGGjFcXf2CH60pCRdUXDEZ0e7VyHRgtQJM80Gbwe9RZ5nUw9"]
[info] [event: :fetched_block_for_validation, block: "wvDgP30P4TS2tODYcOqk0UQozalOH8D6Bpp-DdKB4KiJa6pjFZLz4mQMYI90aOpa", peer: '148.251.135.52:1984']
[info] [event: :processing_block, peer: '148.251.135.52:1984', height: 1191310, step_number: 8046249, block: "wvDgP30P4TS2tODYcOqk0UQozalOH8D6Bpp-DdKB4KiJa6pjFZLz4mQMYI90aOpa", miner_address: "HnjnoDf25mJroiFgY3FJLYw3EsUtcF9LDcJYMI3gKZs", previous_block: "Qj1UA61EnIJbjUkvsGGjFcXf2CH60pCRdUXDEZ0e7VyHRgtQJM80Gbwe9RZ5nUw9"]
[info] [event: :fetched_block_for_validation, block: "wvDgP30P4TS2tODYcOqk0UQozalOH8D6Bpp-DdKB4KiJa6pjFZLz4mQMYI90aOpa", peer: '5.9.18.85:1984']
[info] [event: :accepted_block, height: 1191310, indep_hash: "wvDgP30P4TS2tODYcOqk0UQozalOH8D6Bpp-DdKB4KiJa6pjFZLz4mQMYI90aOpa"]

nil
iex(8)>
BREAK: (a)bort (A)bort with dump (c)ontinue (p)roc info (i)nfo
(l)oaded (v)ersion (k)ill (D)b-tables (d)istribution
a
[os_mon] cpu supervisor port (cpu_sup): Erlang has closed
[os_mon] memory supervisor port (memsup): Erlang has closed
```
## Check the testnet node info
```shell
➜  arweave_ex git:(main) ✗
arweave_ex git:(main) ✗ curl http://127.0.0.1:1984/
{"network":"arweave.2.6.testnet","version":5,"release":62,"height":1191305,"current":"I8x0eMXrqGCY1V_VQ0VbtuA4_pW6n0Ll5XAOHY2Vlq-1kmgDh78Bsc55eeXX4F2J","blocks":9,"peers":0,"queue_length":0,"node_state_latency":281}% 

```
## Start the mainnet node
```shell
$ sh tool.sh mainnet
```