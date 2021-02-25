defmodule Examen.HelperAutor.Autor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "autor" do
    field :nombre, :string
    has_many :libros, Examen.HelperLibro.Libro

    timestamps()
  end

  @doc false
  def changeset(autor, attrs) do
    autor
    |> cast(attrs, [:nombre, :libros_id])
    |> assoc_constraint(:libros)
    |> validate_required([:nombre, :libros_id])
  end
end
