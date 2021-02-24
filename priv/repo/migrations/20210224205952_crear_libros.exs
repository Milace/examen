defmodule Examen.Repo.Migrations.CrearLibros do
  use Ecto.Migration

  def change do
    create table(:libros)
      add :nombre, :string
      belongs_to :autor, Autor
      belongs_to :biblioteca, Biblioteca

      timestamps()
  end
end
