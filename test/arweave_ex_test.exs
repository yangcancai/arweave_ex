defmodule ArweaveExTest do
  use ExUnit.Case
  doctest ArweaveEx

  test "greets the world" do
    assert ArweaveEx.hello() == :world
  end
end
