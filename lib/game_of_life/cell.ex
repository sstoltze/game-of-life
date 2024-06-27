defmodule GameOfLife.Cell do
  defstruct [:contents]

  def get(%__MODULE__{contents: contents}) do
    contents
  end
end
