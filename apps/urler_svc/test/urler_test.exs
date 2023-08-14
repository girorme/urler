defmodule UrlerTest do
  use ExUnit.Case
  doctest UrlerSvc

  test "greets the world" do
    assert UrlerSvc.hello() == :world
  end
end
