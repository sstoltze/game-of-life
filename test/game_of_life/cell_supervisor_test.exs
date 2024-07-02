defmodule CellSupervisorTest do
  use ExUnit.Case
  use ExUnitProperties

  alias GameOfLife.Cell
  alias GameOfLife.CellSupervisor

  test "cell supervisor starts cells" do
    assert Registry.count(CellRegistry) ==
             CellSupervisor |> Supervisor.count_children() |> Map.get(:workers)
  end

  test "cell supervisor can be queried to get cells it is supervising" do
    assert CellSupervisor.cell(1, 2) |> Cell.get() |> is_nil()
  end

  property "cell neighbours are next to the cell" do
    check all(
            {{x, y}, _pid, _, _} <- member_of(Supervisor.which_children(CellSupervisor)),
            neighbour <- member_of(CellSupervisor.neighbours(x, y))
          ) do
      {a, b} = Cell.coordinates(neighbour)
      assert abs(x - a) <= 1 and abs(y - b) <= 1
    end
  end
end
