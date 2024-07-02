defmodule CellSupervisorTest do
  use ExUnit.Case

  alias GameOfLife.Cell
  alias GameOfLife.CellSupervisor

  test "cell supervisor starts cells" do
    assert Registry.count(CellRegistry) ==
             CellSupervisor |> Supervisor.count_children() |> Map.get(:workers)
  end

  test "cell supervisor can be queried to get cells it is supervising" do
    assert CellSupervisor.cell(1, 2) |> Cell.get() |> is_nil()
  end

  test "supervisor can fetch neighbours of a cell" do
    assert CellSupervisor.neighbours(1, 1) |> Enum.sort() ==
             [
               CellSupervisor.cell(2, 1),
               CellSupervisor.cell(1, 2),
               CellSupervisor.cell(2, 2)
             ]
             |> Enum.sort()
  end
end
