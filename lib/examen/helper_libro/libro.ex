defmodule Examen.HelperLibro.Libro do
  use Ecto.Schema
  import Ecto.Changeset

  schema "libro" do
    field :nombre, :string
    belongs_to :biblioteca, Examen.Helpers.Biblioteca
    belongs_to :autor, Examen.HelperAutor.Autor

    timestamps()
  end

  @doc false
  def changeset(libro, attrs) do
    libro
    |> cast(attrs, [:nombre, :biblioteca_id, :autor_id])
    |> validate_required([:nombre, :biblioteca, :autor])
  end
end
