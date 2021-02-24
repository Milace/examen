defmodule Examen.Repo.Migrations.CrearAutores do
  use Ecto.Migration

  def change do
    create table(:autores)
      add :nombre, :string
      belongs_to :autor, Autor
      belongs_to :biblioteca, Biblioteca

      timestamps()
  end
end
