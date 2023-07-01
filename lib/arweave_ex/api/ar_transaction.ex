defmodule ArweaveEx.ArTransaction do
  @moduledoc false
  #  -record(tx, {
  # 	%% 1 or 2.
  # 	format = 1,
  # 	%% The transaction identifier.
  # 	id = <<>>,
  # 	%% Either the identifier of the previous transaction from
  # 	%% the same wallet or the identifier of one of the
  # 	%% last ?MAX_TX_ANCHOR_DEPTH blocks.
  # 	last_tx = <<>>,
  # 	%% The public key the transaction is signed with.
  # 	owner =	<<>>,
  # 	%% A list of arbitrary key-value pairs. Keys and values are binaries.
  # 	tags = [],
  # 	%% The address of the recipient, if any. The SHA2-256 hash of the public key.
  # 	target = <<>>,
  # 	%% The amount of Winstons to send to the recipient, if any.
  # 	quantity = 0,
  # 	%% The data to upload, if any. For v2 transactions, the field is optional - a fee
  # 	%% is charged based on the "data_size" field, data itself may be uploaded any time
  # 	%% later in chunks.
  # 	data = <<>>,
  # 	%% Size in bytes of the transaction data.
  # 	data_size = 0,
  # 	%% Deprecated. Not used, not gossiped.
  # 	data_tree = [],
  # 	%% The Merkle root of the Merkle tree of data chunks.
  # 	data_root = <<>>,
  # 	%% The signature.
  # 	signature = <<>>,
  # 	%% The fee in Winstons.
  # 	reward = 0,
  #
  # 	%% The code for the denomination of AR in base units.
  # 	%%
  # 	%% 1 corresponds to the original denomination of 1^12 base units.
  # 	%% Every time the available supply falls below ?REDENOMINATION_THRESHOLD,
  # 	%% the denomination is multiplied by 1000, the code is incremented.
  # 	%%
  # 	%% 0 is the default denomination code. It is treated as the denomination code of the
  # 	%% current block. We do NOT default to 1 because we want to distinguish between the
  # 	%% transactions with the explicitly assigned denomination (the denomination then becomes
  # 	%% a part of the signature preimage) and transactions signed the way they were signed
  # 	%% before the upgrade. The motivation is to keep supporting legacy client libraries after
  # 	%% redenominations and at the same time protect users from an attack where
  # 	%% a post-redenomination transaction is included in a pre-redenomination block. The attack
  # 	%% is prevented by forbidding inclusion of transactions with denomination=0 in the 100
  # 	%% blocks preceding the redenomination block.
  # 	%%
  # 	%% Transaction denomination code must not exceed the block's denomination code.
  # 	denomination = 0,
  #
  # 	%% The type of signature this transaction was signed with. A system field,
  # 	%% not used by the protocol yet.
  # 	signature_type = ?DEFAULT_KEY_TYPE
  # }).
  defstruct [
    :format,
    :id,
    :last_tx,
    :owner,
    :tags,
    :target,
    :quantity,
    :data,
    :data_size,
    :data_tree,
    :data_root,
    :signature,
    :reward,
    :denomination,
    :signature_type
  ]

  defimpl Jason.Encoder, for: ArweaveEx.ArTransaction do
    @impl Jason.Encoder
    def encode(value, opts) do
      value
      |> Map.from_struct()
      |> Map.take([
        :id,
        :format,
        :last_tx,
        :owner,
        :tags,
        :target,
        :quantity,
        :data,
        :data_size,
        :data_root,
        :signature,
        :reward
      ])
      |> Map.new(&format/1)
      |> Jason.Encode.map(opts)
    end

  def format({:owner, v}) do
    {:owner, :b64fast.encode(v)}
  end

  def format({:data, v}) do
    {:data, :b64fast.encode(v)}
  end

  def format({:data_root, v}) do
    {:data_root, :b64fast.encode(v)}
  end

  def format({:signature, v}) do
    {:signature, :b64fast.encode(v)}
  end
  def format({:last_tx, v}) do
      {:last_tx, :b64fast.encode(v)}
  end
  def format({:format, v}) do
      {:format, v}
  end
  def format({k, v}) when is_integer(v) do
    {k, Integer.to_string(v)}
  end
  def format({:id, v}) do
      {:id, :b64fast.encode(v)}
  end
  def format(v), do: v
  end

  def new_data_tx(data) do
    tx = new_tx()
    %__MODULE__{tx | data: data, data_size: String.length(data)}
  end

  def new_tx() do
    %__MODULE__{
      format: 2,
      id: "",
      last_tx: "",
      owner: "",
      tags: [],
      target: "",
      quantity: 0,
      data: "",
      data_size: 0,
      data_tree: [],
      data_root: "",
      signature: "",
      reward: 0,
      denomination: 0,
      signature_type: {:ras, 65537}
    }
  end

  def sign(
        %__MODULE__{
          format: format,
          id: id,
          last_tx: last_tx,
          tags: tags,
          target: target,
          quantity: quantity,
          data: data,
          data_size: data_size,
          denomination: denomination,
          reward: reward
        } = artx,
        {privkey, {type, pub}}
      ) do
    tx =
      {:tx, format, id, last_tx, pub, tags, target, quantity, data, data_size, [], "", "", reward,
       denomination, type}

    # generate data_root
    tx1 = :ar_tx.generate_chunk_tree(tx)
    # generate signature
    tx2 = :ar_tx.sign(tx1, {privkey, {type, pub}})
    IO.puts("tx=#{inspect(tx2)}")
    %__MODULE__{
      artx
      | owner: :erlang.element(5, tx2),
        signature: :erlang.element(13, tx2),
        data_root: :erlang.element(12, tx2),
        id: :erlang.element(3, tx2)
    }
  end
end
