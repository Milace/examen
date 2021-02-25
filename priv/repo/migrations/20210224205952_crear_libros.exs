defmodule Examen.Repo.Migrations.CrearLibros do
  use Ecto.Migration

  def change do
    create table(:libros) do
      add :nombre, :string

      timestamps()
    end
  end
end
