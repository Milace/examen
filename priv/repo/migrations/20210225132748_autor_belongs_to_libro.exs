defmodule Examen.Repo.Migrations.AutorBelongsToLibro do
  use Ecto.Migration

  def change do
    alter table(:autores) do
      add :libro_id, references(:libros)
    end
  end
end
