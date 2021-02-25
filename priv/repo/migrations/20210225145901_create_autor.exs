defmodule Examen.Repo.Migrations.CreateAutor do
  use Ecto.Migration

  def change do
    create table(:autor) do
      add :nombre, :string

      timestamps()
    end

  end
end
