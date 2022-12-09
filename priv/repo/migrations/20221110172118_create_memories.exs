defmodule Pensieve.Repo.Migrations.CreateMemories do
  use Ecto.Migration

  def change do
    create table(:memories) do
      add :title, :string, null: false, size: 100
      add :content, :text

      timestamps()
    end

    create index(:memories, [:inserted_at, :id])
  end
end
