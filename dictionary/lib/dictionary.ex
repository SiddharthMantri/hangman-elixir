defmodule Dictionary do

  # Module attribute (created at compile time)
  # Compile time code execution (wtf?)
  @word_list "assets/words.txt"
    |> File.read!
    |> String.split(~r/\n/, trim: true)

  def random_word do
    @word_list
    |> Enum.random
  end

end
