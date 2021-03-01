defmodule Examen.HelperAutor do
  @moduledoc """
  The HelperAccounts context.
  """

  import Ecto.Query, warn: false
  alias Examen.Repo
  alias Examen.HelperAutor.Autor

  @doc """
  Returns the list of autor.

  ## Examples

      iex> list_autor()
      [%Autor{}, ...]

  """
  def list_autor do
    Repo.all(Autor)
  end

  @doc """
  Gets a single autor.

  Raises `Ecto.NoResultsError` if the Autor does not exist.

  ## Examples

      iex> get_autor!(123)
      %Autor{}

      iex> get_autor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_autor!(id), do: Repo.get!(Autor, id)

  @doc """
  Creates a autor.

  ## Examples

      iex> create_autor(%{field: value})
      {:ok, %Autor{}}

      iex> create_autor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_autor(attrs \\ %{}) do
    %Autor{}
    |> Autor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a autor.

  ## Examples

      iex> update_autor(autor, %{field: new_value})
      {:ok, %Autor{}}

      iex> update_autor(autor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_autor(%Autor{} = autor, attrs) do
    autor
    |> Autor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a autor.

  ## Examples

      iex> delete_autor(autor)
      {:ok, %Autor{}}

      iex> delete_autor(autor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_autor(%Autor{} = autor) do
    Repo.delete(autor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking autor changes.

  ## Examples

      iex> change_autor(autor)
      %Ecto.Changeset{data: %Autor{}}

  """
  def change_autor(%Autor{} = autor, attrs \\ %{}) do
    Autor.changeset(autor, attrs)
  end

  def get_all_by_autor(id) do
    query = from a in Autor,
              join: l in assoc(a, :libros),
              join: b in assoc(l, :biblioteca),
              where: a.id == ^id,
              select: a.nombre
      Repo.one(query)
  end
end
