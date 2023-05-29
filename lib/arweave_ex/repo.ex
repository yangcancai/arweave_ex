defmodule ArweaveEx.Repo do
  use Ecto.Repo,
    otp_app: :arweave_ex,
    adapter: Ecto.Adapters.Postgres
end
