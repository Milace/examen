defmodule Examen.HelperLibro.Libro do
  use Ecto.Schema
  import Ecto.Changeset

  schema "libro" do
    field :nombre, :string
    belongs_to :biblioteca, Examen.HelperBiblioteca.Biblioteca
    belongs_to :autor, Examen.HelperAutor.Autor

    timestamps()
  end

  @doc false
  def changeset(libro, attrs) do
    libro
    |> cast(attrs, [:nombre])
    |> assoc_constraint(:biblioteca)
    |> assoc_constraint(:autor)
    |> validate_required([:nombre])
  end
end
