defmodule GameOfLife.CellTest do
  use ExUnit.Case
  alias GameOfLife.Cell

  test "cells let you get their contents" do
    c = %Cell{contents: nil}
    assert Cell.get(c) == nil
  end
end
