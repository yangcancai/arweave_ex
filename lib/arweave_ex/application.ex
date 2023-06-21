defmodule ArweaveEx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger
  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ArweaveExWeb.Telemetry,
      # Start the Ecto repository
#      ArweaveEx.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ArweaveEx.PubSub},
      # Start Finch
      {Finch, name: ArweaveEx.Finch},
      # Start the Endpoint (http/https)
      ArweaveExWeb.Endpoint
      # Start a worker by calling: ArweaveEx.Worker.start_link(arg)
      # {ArweaveEx.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ArweaveEx.Supervisor]
    res = Supervisor.start_link(children, opts)
    res
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ArweaveExWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
