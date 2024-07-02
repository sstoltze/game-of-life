defmodule GameOfLife.CellTest do
  use ExUnit.Case
  alias GameOfLife.Cell

  test "cells let you get their contents" do
    {:ok, c} = Cell.new(0, 0, contents: :a_thing)
    assert Cell.get(c) == :a_thing
  end

  test "cells can be queried by coordinates" do
    Cell.new(0, 0, contents: :another_thing)
    assert Cell.get(0, 0) == :another_thing
  end

  test "cells can have their contents set" do
    {:ok, pid} = Cell.new(0, 0, contents: :a_thing)
    assert Cell.get(pid) == :a_thing
    Cell.set(pid, :another_thing)
    assert Cell.get(pid) == :another_thing
  end

  test "cells can determine their next state based on their neighbourhood" do
    {:ok, live} = Cell.new(:a, :b, contents: true)
    {:ok, dead} = Cell.new(:c, :d, contents: nil)
    assert Cell.next_state(live, live_neighbours(3))
    assert Cell.next_state(dead, live_neighbours(3))
    assert Cell.next_state(live, live_neighbours(2))
    refute Cell.next_state(dead, live_neighbours(2))
    refute Cell.next_state(live, live_neighbours(1))
    refute Cell.next_state(dead, live_neighbours(1))
    refute Cell.next_state(live, live_neighbours(4))
    refute Cell.next_state(dead, live_neighbours(4))
  end

  test "cells can report their coordinates" do
    {:ok, cell} = Cell.new(:a, :b, [])
    assert Cell.coordinates(cell) == {:a, :b}
  end

  defp live_neighbours(n),
    do: Enum.map(1..n, fn _ -> true end) ++ Enum.map(1..(8 - n), fn _ -> nil end)
end
