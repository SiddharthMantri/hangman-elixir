defmodule TextClient.Impl.Player do

  @typep game :: Hangman.game
  @typep tally :: Hangman.tally
  
  @typep state :: {
    game,
    tally
  }
  
  def start() do
    game = Hangman.new_game()
    tally = Hangman.tally(game)
    interact({ game, tally })
  end
  
  # @type state :: :initializing | :lost | :good_guess | :bad_guess | :already_used

  @spec interact(state) :: :ok

  def interact({_game, _tally = %{game_state: :won}}) do
    IO.puts "Congrats, you won!"
  end

  def interact({_game, tally = %{game_state: :lost}}) do
    IO.puts "Sorry, you lost. The word was #{tally.letters |> Enum.join}"
  end

  def interact({ game, tally }) do
    IO.puts feedback_for(tally)
    # interact()
  end

  def feedback_for(tally = %{ game_state: :initializing}) do
    "Welcome! I'm thinking of a #{tally.letters |> length} letter word"
  end

  def feedback_for(_tally = %{ game_state: :good_guess}), do: "Good guess!"
  def feedback_for(_tally = %{ game_state: :bad_guess}), do: "Incorrect guess!"
  def feedback_for(_tally = %{ game_state: :already_used}), do: "You've used that already"

end