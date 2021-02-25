defmodule Examen.Repo.Migrations.CrearAutores do
  use Ecto.Migration

  def change do
    create table(:autores) do
      add :nombre, :string

      timestamps()
    end
  end
end
