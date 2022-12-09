defmodule PensieveWeb.MemoryView do
  use PensieveWeb, :view

  def format_timestamp(timestamp) do
    Calendar.strftime(timestamp, "%d/%m/%Y %H:%M")
  end
end
