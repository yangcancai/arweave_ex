defmodule ArweaveEx do
  @moduledoc """
  ArweaveEx keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  require Logger

  def start() do
    args = String.trim(System.get_env("AR_ARGS"))
    Logger.info("args = #{inspect(args)}")

    args
    |> String.split(" ")
    |> Enum.map(&String.to_charlist(&1))
    |> :ar.main()
    case String.split(args, "init") do
        [_,_] ->
          init_network
        _->
    end
  end

  def init_network() do
    :arweave_ex_tool.init_new()
  end
end
