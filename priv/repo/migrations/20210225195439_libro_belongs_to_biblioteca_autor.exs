defmodule Examen.Repo.Migrations.LibroBelongsToBibliotecaAutor do
  use Ecto.Migration

  def change do
    alter table(:libro) do
      add :autor_id, references(:autor, on_delete: :nothing)
      add :biblioteca_id, references(:biblioteca, on_delete: :nothing)
    end
  end
end
