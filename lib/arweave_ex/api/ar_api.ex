defmodule ArweaveEx.ArApi do
  @moduledoc false
  use Tesla
  plug Tesla.Middleware.BaseUrl, "http://127.0.0.1:1984"
  plug Tesla.Middleware.Headers, [{"authorization", ""}]
  plug Tesla.Middleware.JSON
  def key() do
    :ar_wallet.load_keyfile("arweave/data_test_master/wallets/arweave_keyfile_HRSylYp8UrVj-XOjtttsgjn4zAOLqhsUc4_N18SLy9A.json")
  end
  def balance(addr) do
    request(:get, :balance, "/wallet/#{addr}/balance")
  end
  def get_last_tx() do
    request(:get, :last_tx, "/tx_anchor")
  end
  def get_tx_status(id) do
    request(:get, :tx_status, "/tx/#{id}/status")
  end
  def get_price(bytes) do
      get_price(bytes, nil)
  end
  def get_price(bytes, nil) do
     request(:get, :price, "/price/#{bytes}")
  end
  def get_price(nil, target) do
    get_price(0, target)
    end
  def get_price(bytes, target) do
     request(:get, :price, "/price/#{bytes}/#{target}")
  end
 def submit_tx() do
   %{data_size: size} = tx = ArweaveEx.ArTransaction.new_data_tx("hello")
   {:ok, last_tx} = get_last_tx
   {:ok, price} = get_price(size)
   req = ArweaveEx.ArTransaction.sign(%ArweaveEx.ArTransaction{tx | last_tx: :b64fast.decode(last_tx), reward: price}, key)
   request(:post, {:submit_tx, req}, "/tx")
 end
  def request(:get, cmd, path) do
    resp(cmd, get(path))
  end
  def request(:post, {cmd, data}, path) do
      IO.puts("req = #{inspect(data)}")
      IO.puts("#{inspect(Jason.encode(data))}")
      post(path, data, headers: [{"content-type", "application/json"},{"x-network", "arweave.localtest"}])
  end

  defp resp(:balance, {:ok, %{status: 200, body: body} = resp}) do
    {:ok, String.to_integer(body)}
  end
  defp resp(:price, {:ok, %{status: 200, body: body} = resp}) do
    {:ok, String.to_integer(body)}
  end
  defp resp(:last_tx, {:ok, %{status: 200, body: body} = resp}) do
    {:ok, body}
  end
  defp resp(resp) do
    resp
  end
end
