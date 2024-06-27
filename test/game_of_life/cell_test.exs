defmodule GameOfLife.CellTest do
  use ExUnit.Case
  alias GameOfLife.Cell

  test "cells let you get their contents" do
    c = Cell.new(0, 0, contents: :a_thing)
    assert Cell.get(c) == :a_thing
  end
end
