defmodule Hangman.Impl.Game do
    
    alias Hangman.Type

    @type t :: %__MODULE__{
        turns_left: integer,
        game_state: Type.state,
        letters: list(String.t),
        used: MapSet.t(String.t),
    } 
    defstruct(
        turns_left: 7,
        game_state: :initializing,
        letters: [],
        used: MapSet.new(),
    ) 

    @spec new_game() :: t
    def new_game do
        new_game(Dictionary.random_word)
    end

    
    @spec new_game(String.t) :: t
    def new_game(word) do
        %__MODULE__{
            letters: word |> String.codepoints
        } #returns new instance of the struct defined above with overriden letters
    end



    @spec make_move(t, String.t) :: { t, Type.tally}
    def make_move(game = %{ game_state: state }, _) 
    when state in [:won, :lost] do #Pattern match on won OR lost game state and ignore guess
        { game, tally(game) }
    end

    # def make_move(game = %{ game_state: :lost }, _) do #Pattern match on lost game state and ignore guess
    #     { game, tally(game) }
    # end


    defp tally(game)do #private function defp
        %{
            turns_left: game.turns_left,
            game_state: game.game_state,
            letters: [],
            used: game.used |> MapSet.to_list |> Enum.sort
        }
    end
end