defmodule Examen.Helpers.Libro do
  use Ecto.Schema
  import Ecto.Changeset

  schema "libros" do
    fiel :nombre, :string
    belongs_to :autor, Autor
    belongs_to :biblioteca, Biblioteca

    timestamps()
  end

  @doc false
  def changeset(libro, attrs) do
    libro
  end
end
