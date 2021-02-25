defmodule Examen.Repo.Migrations.AutorBelongsToLibroNew do
  use Ecto.Migration

  def change do
    alter table(:autor) do
      add :libro_id, references(:libro, on_delete: :nothing)
    end
  end
end
