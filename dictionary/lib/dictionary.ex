defmodule Dictionary do

  alias Dictionary.Impl.Words

  defdelegate start, to: Words
  defdelegate random_word(), to: Words
  defdelegate random_word(words), to: Words

end
