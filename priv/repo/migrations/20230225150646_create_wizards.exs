defmodule Pensieve.Repo.Migrations.CreateWizards do
  use Ecto.Migration

  def change do
    create table(:wizards) do
      add :first_name, :string
      add :last_name, :string
      add :house, :string
      add :points, :integer

      timestamps()
    end
  end
end
