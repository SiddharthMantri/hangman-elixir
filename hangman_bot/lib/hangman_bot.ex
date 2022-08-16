defmodule HangmanBot do
  
  # Init new game
  # Make guess
  # Evaluate state, tally
  # Repeat

  def make_guess do
    Enum.random('abcdefghijklmnopqrstuvwxyz')
  end

  def start do
    game = Hangman.new_game()
  end
end
