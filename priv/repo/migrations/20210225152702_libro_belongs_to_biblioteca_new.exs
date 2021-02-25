defmodule Examen.Repo.Migrations.LibroBelongsToBibliotecaNew do
  use Ecto.Migration

  def change do
    alter table(:libro) do
      add :biblioteca_id, references(:biblioteca)
    end
  end
end
