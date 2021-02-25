defmodule Examen.Helpers.Libro do
  use Ecto.Schema
  import Ecto.Changeset

  schema "libros" do
    field :nombre, :string
    belongs_to :biblioteca, Examen.Helpers.Biblioteca
    belongs_to :autor, Examen.Helpers.Autor

    timestamps()
  end

  @doc false
  def changeset(libro, attrs) do
    libro
    |> cast(attrs, [:nombre, :biblioteca, :autor])
    |> validate_required([:nombre, :biblioteca, :autor])
  end
end
