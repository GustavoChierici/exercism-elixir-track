defmodule KitchenCalculator do
  def get_volume({_unit, volume}), do: volume

  def to_milliliter({:milliliter, volume}), do: {:milliliter, volume}
  def to_milliliter({:cup, volume}), do: {:milliliter, 240 * volume}
  def to_milliliter({:fluid_ounce, volume}), do: {:milliliter, 30 * volume}
  def to_milliliter({:teaspoon, volume}), do: {:milliliter, 5 * volume}
  def to_milliliter({:tablespoon, volume}), do: {:milliliter, 15 * volume}

  def from_milliliter({_unit, volume}, :milliliter), do: {:milliliter, volume}
  def from_milliliter({_unit, volume}, :cup), do: {:cup, volume / 240}
  def from_milliliter({_unit, volume}, :fluid_ounce), do: {:fluid_ounce, volume / 30}
  def from_milliliter({_unit, volume}, :teaspoon), do: {:teaspoon, volume / 5}
  def from_milliliter({_unit, volume}, :tablespoon), do: {:tablespoon, volume / 15}

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair)
    |> from_milliliter(unit)
  end
end
