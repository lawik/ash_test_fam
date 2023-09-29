defmodule Fam.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      FamWeb.Telemetry,
      # Start the Ecto repository
      Fam.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Fam.PubSub},
      # Start Finch
      {Finch, name: Fam.Finch},
      # Start the Endpoint (http/https)
      FamWeb.Endpoint
      # Start a worker by calling: Fam.Worker.start_link(arg)
      # {Fam.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fam.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FamWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
