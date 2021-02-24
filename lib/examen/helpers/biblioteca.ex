defmodule Examen.Helpers.Biblioteca do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bibliotecas" do
      fiel :nombre, :string
      has_many :libros, Libro

      timestamps()
  end

  @doc false
  def changeset(biblioteca, attrs) do
    biblioteca
  end
end
