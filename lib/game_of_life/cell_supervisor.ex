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

  def cell(x, y) do
    children = Supervisor.which_children(__MODULE__)

    Enum.find_value(children, nil, fn {coords, pid, :worker, [GameOfLife.Cell]} ->
      if {x, y} == coords, do: pid
    end)
  end

  def neighbours(x, y) do
    for i <- -1..1, j <- -1..1, i != 0 or j != 0 do
      cell(x + i, y + j)
    end
    |> Enum.reject(&is_nil/1)
  end
end
