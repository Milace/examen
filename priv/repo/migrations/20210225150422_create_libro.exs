defmodule Examen.Repo.Migrations.CreateLibro do
  use Ecto.Migration

  def change do
    create table(:libro) do
      add :nombre, :string

      timestamps()
    end

  end
end
