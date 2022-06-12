defmodule Lasagna do
  def expected_minutes_in_oven(), do: 40

  def remaining_minutes_in_oven(actual_minutes) do
    expected_minutes_in_oven() - actual_minutes
  end

  def preparation_time_in_minutes(num_layers), do: 2 * num_layers

  def total_time_in_minutes(num_layers, actual_minutes) do
    preparation_time_in_minutes(num_layers) + actual_minutes
  end

  def alarm(), do: "Ding!"
end
