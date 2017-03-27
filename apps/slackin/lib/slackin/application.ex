defmodule Slackin.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    slackin_token = Application.get_env(:slack, Slackin.Kin)[:secret_key]
    # IO.inspect(slackin_token)
    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: Slackin.Worker.start_link(arg1, arg2, arg3)
      worker(Slack.Bot, [ Slackin.Kin, [], slackin_token ]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Slackin.Supervisor]
    Supervisor.start_link(children, opts)
  end
end