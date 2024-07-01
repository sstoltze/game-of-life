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
end
