defmodule Examen.Repo.Migrations.LibroBelongsToBibliotecaAutor do
  use Ecto.Migration

  def change do
    alter table(:libro) do
      add :autor_id, references(:autor, on_delete: :delete_all)
      add :biblioteca_id, references(:biblioteca, on_delete: :delete_all)
    end
  end
end
