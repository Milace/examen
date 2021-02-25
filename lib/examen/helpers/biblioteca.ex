defmodule Examen.Helpers.Biblioteca do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bibliotecas" do
      field :nombre, :string
      has_many :libros, Examen.Helpers.Libro

      timestamps()
  end

  @doc false
  def changeset(biblioteca, attrs) do
    biblioteca
    |> cast(attrs, [:nombre, :libros])
    |> validate_required([:nombre, :libros])
  end
end
