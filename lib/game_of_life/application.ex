defmodule GameOfLife.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @board_size 10

  @impl true
  def start(_type, _args) do
    children = [
      {Registry, [name: CellRegistry, keys: :unique]},
      {GameOfLife.CellSupervisor, @board_size}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GameOfLife.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
