defmodule ExamenWeb.AutorController do
  use ExamenWeb, :controller

  alias Examen.HelperAutor
  alias Examen.HelperAutor.Autor

  def index(conn, _params) do
    autor = HelperAutor.list_autor()
    render(conn, "index.html", autor: autor)
  end

  def new(conn, _params) do
    changeset = HelperAutor.change_autor(%Autor{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"autor" => autor_params}) do
    case HelperAutor.create_autor(autor_params) do
      {:ok, autor} ->
        conn
        |> put_flash(:info, "Autor created successfully.")
        |> redirect(to: Routes.autor_path(conn, :show, autor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    autor = HelperAutor.get_autor!(id)
    render(conn, "show.html", autor: autor)
  end

  def edit(conn, %{"id" => id}) do
    autor = HelperAutor.get_autor!(id)
    changeset = HelperAutor.change_autor(autor)
    render(conn, "edit.html", autor: autor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "autor" => autor_params}) do
    autor = HelperAutor.get_autor!(id)

    case HelperAutor.update_autor(autor, autor_params) do
      {:ok, autor} ->
        conn
        |> put_flash(:info, "Autor updated successfully.")
        |> redirect(to: Routes.autor_path(conn, :show, autor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", autor: autor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    autor = HelperAutor.get_autor!(id)
    {:ok, _autor} = HelperAutor.delete_autor(autor)

    conn
    |> put_flash(:info, "Autor deleted successfully.")
    |> redirect(to: Routes.autor_path(conn, :index))
  end
end
