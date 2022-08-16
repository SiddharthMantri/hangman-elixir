defmodule Dictionary.Impl.Words do

  def start do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/, trim: true)
  end

  def random_word do
    words = start()
    random_word(words)
  end

  def random_word(words) do
    words
    |> Enum.random
  end
end
