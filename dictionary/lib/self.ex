defmodule Self do
    def swap({a, b}), do: {b,a}

    def equate(a, a), do: true
    def equate(_, _), do: false
end