defmodule SatchelTest do
  use ExUnit.Case
  doctest Satchel

  test "greets the world" do
    assert Satchel.hello() == :world
  end
end
