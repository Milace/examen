defmodule Examen.Repo.Migrations.CreateBiblioteca do
  use Ecto.Migration

  def change do
    create table(:biblioteca) do
      add :nombre, :string

      timestamps()
    end

  end
end
