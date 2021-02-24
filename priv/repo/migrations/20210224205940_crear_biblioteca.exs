defmodule Examen.Repo.Migrations.CrearBiblioteca do
  use Ecto.Migration

  def change do
    create table(:bibliotecas)
      add :nombre, :string
      has_many :libros, Libro

      timestamps()
  end
end
