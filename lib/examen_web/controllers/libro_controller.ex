defmodule ExamenWeb.LibroController do
  use ExamenWeb, :controller

  alias Examen.HelperLibro
  alias Examen.HelperLibro.Libro

  def index(conn, _params) do
    libro = HelperLibro.list_libro()
    render(conn, "index.html", libro: libro)
  end

  def new(conn, _params) do
    changeset = HelperLibro.change_libro(%Libro{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"libro" => libro_params}) do
    case HelperLibro.create_libro(libro_params) do
      {:ok, libro} ->
        conn
        |> put_flash(:info, "Libro created successfully.")
        |> redirect(to: Routes.libro_path(conn, :show, libro))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    libro = HelperLibro.get_libro!(id)
    render(conn, "show.html", libro: libro)
  end

  def edit(conn, %{"id" => id}) do
    libro = HelperLibro.get_libro!(id)
    changeset = HelperLibro.change_libro(libro)
    render(conn, "edit.html", libro: libro, changeset: changeset)
  end

  def update(conn, %{"id" => id, "libro" => libro_params}) do
    libro = HelperLibro.get_libro!(id)

    case HelperLibro.update_libro(libro, libro_params) do
      {:ok, libro} ->
        conn
        |> put_flash(:info, "Libro updated successfully.")
        |> redirect(to: Routes.libro_path(conn, :show, libro))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", libro: libro, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    libro = HelperLibro.get_libro!(id)
    {:ok, _libro} = HelperLibro.delete_libro(libro)

    conn
    |> put_flash(:info, "Libro deleted successfully.")
    |> redirect(to: Routes.libro_path(conn, :index))
  end
end
