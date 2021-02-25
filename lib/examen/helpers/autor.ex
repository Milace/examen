defmodule Examen.Helpers.Autor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "autores" do
    field :nombre, :string
    has_many :libros, Examen.Helpers.Libro

    timestamps()
  end

  @doc false
  def changeset(autor, attrs) do
    autor
    |> cast(attrs, [:nombre, :libros])
    |> validate_required([:nombre, :libros])
  end
end
