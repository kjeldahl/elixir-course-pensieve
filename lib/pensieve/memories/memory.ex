defmodule Pensieve.Memories.Memory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "memories" do
    field :content, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(memory, attrs) do
    memory
    |> cast(attrs, [:title, :content])
    |> validate_required([:title])
    |> validate_length(:title, max: 100)
    |> validate_format(:content, ~r/^((?!voldemort).)*$/i, message: "We do not speak of the eviil one")
  end
end
