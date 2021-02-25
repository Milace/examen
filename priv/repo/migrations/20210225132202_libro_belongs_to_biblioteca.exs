defmodule Examen.Repo.Migrations.LibroBelongsToBiblioteca do
  use Ecto.Migration

  def change do
    alter table(:libros) do
      add :biblioteca_id, references(:bibliotecas)
    end
  end
end
