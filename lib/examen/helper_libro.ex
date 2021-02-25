defmodule Examen.HelperLibro do
  @moduledoc """
  The HelperAccounts context.
  """

  import Ecto.Query, warn: false
  alias Examen.Repo
  alias Examen.HelperLibro.Libro

  @doc """
  Returns the list of libro.

  ## Examples

      iex> list_libro()
      [%Libro{}, ...]

  """
  def list_libro do
    Repo.all(Libro)
  end

  @doc """
  Gets a single libro.

  Raises `Ecto.NoResultsError` if the Libro does not exist.

  ## Examples

      iex> get_libro!(123)
      %Libro{}

      iex> get_libro!(456)
      ** (Ecto.NoResultsError)

  """
  def get_libro!(id), do: Repo.get!(Libro, id)

  @doc """
  Creates a libro.

  ## Examples

      iex> create_libro(%{field: value})
      {:ok, %Libro{}}

      iex> create_libro(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_libro(attrs \\ %{}) do
    %Libro{}
    |> Libro.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a libro.

  ## Examples

      iex> update_libro(libro, %{field: new_value})
      {:ok, %Libro{}}

      iex> update_libro(libro, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_libro(%Libro{} = libro, attrs) do
    libro
    |> Libro.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a libro.

  ## Examples

      iex> delete_libro(libro)
      {:ok, %Libro{}}

      iex> delete_libro(libro)
      {:error, %Ecto.Changeset{}}

  """
  def delete_libro(%Libro{} = libro) do
    Repo.delete(libro)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking libro changes.

  ## Examples

      iex> change_libro(libro)
      %Ecto.Changeset{data: %Libro{}}

  """
  def change_libro(%Libro{} = libro, attrs \\ %{}) do
    Libro.changeset(libro, attrs)
  end
end
