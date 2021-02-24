defmodule Examen.Helpers.Autor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "autores" do
    fiel :nombre, :string
    has_many :libros,

    timestamps()
  end

  @doc false
  def changeset(autor, attrs) do
    autor
  end
end
