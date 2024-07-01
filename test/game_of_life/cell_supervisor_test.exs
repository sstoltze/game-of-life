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
end
