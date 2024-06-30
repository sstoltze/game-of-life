defmodule CellSupervisorTest do
  use ExUnit.Case

  test "cell supervisor starts cells" do
    assert Registry.count(CellRegistry) ==
             GameOfLife.CellSupervisor |> Supervisor.count_children() |> Map.get(:workers)
  end
end
