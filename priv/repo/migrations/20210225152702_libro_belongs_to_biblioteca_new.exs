defmodule Examen.Repo.Migrations.LibroBelongsToBibliotecaNew do
  use Ecto.Migration

  def change do
    alter table(:biblioteca) do
      add :libro_id, references(:libro, on_delete: :nothing)
    end
  end
end
