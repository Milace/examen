defmodule Examen.Repo.Migrations.CrearBiblioteca do
  use Ecto.Migration

  def change do
    create table(:bibliotecas) do
      add :nombre, :string

      timestamps()
    end
  end
end
