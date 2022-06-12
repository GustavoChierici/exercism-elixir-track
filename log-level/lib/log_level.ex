defmodule LogLevel do
  @log_labels %{
    0 => :trace,
    1 => :debug,
    2 => :info,
    3 => :warning,
    4 => :error,
    5 => :fatal
  }
  @valid_codes 0..5
  @legacy_codes 1..4

  def to_label(level, legacy?) do
      cond do
        level in @valid_codes and not legacy? ->
          @log_labels[level]
        level in @legacy_codes and legacy? ->
          @log_labels[level]
        true -> :unknown
      end
  end


  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)

    cond do
      label in [:error, :fatal] -> :ops
      label === :unknown and legacy? -> :dev1
      label === :unknown and not legacy? -> :dev2
      true -> false
    end
  end
end
