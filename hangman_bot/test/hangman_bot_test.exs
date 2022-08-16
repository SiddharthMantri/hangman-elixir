defmodule HangmanBotTest do
  use ExUnit.Case
  doctest HangmanBot

  test "greets the world" do
    assert HangmanBot.hello() == :world
  end
end
