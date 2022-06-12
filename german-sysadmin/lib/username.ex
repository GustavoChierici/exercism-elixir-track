defmodule Username do

  def sanitize([]), do: []
  def sanitize([char | tail]) do
    case char do
      char when char in ?a..?z -> [char]
      ?_ -> '_'
      ?ä -> 'ae'
      ?ö ->	'oe'
      ?ü ->	'ue'
      ?ß -> 'ss'
      _c -> ''
    end
    |> Kernel.++(sanitize(tail))
  end
end
