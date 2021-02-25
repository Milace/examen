defmodule Examen.HelperBiblioteca.Biblioteca do
  use Ecto.Schema
  import Ecto.Changeset

  schema "biblioteca" do
    field :nombre, :string
    has_many :libros, Examen.HelperLibro.Libro

    timestamps()
  end

  @doc false
  def changeset(biblioteca, attrs) do
    biblioteca
    |> cast(attrs, [:nombre])
    |> validate_required([:nombre])
  end
end
