defmodule GameOfLife.CellSupervisor do
  use Supervisor

  def start_link(init_args) do
    Supervisor.start_link(__MODULE__, init_args, name: __MODULE__)
  end

  @impl Supervisor
  def init(board_size) do
    child_spec =
      for i <- 1..board_size, j <- 1..board_size do
        {GameOfLife.Cell, {i, j}}
      end

    Supervisor.init(child_spec, strategy: :one_for_one)
  end
end
