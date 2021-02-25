defmodule ExamenWeb.AutorControllerTest do
  use ExamenWeb.ConnCase

  alias Examen.HelperAutor

  @create_attrs %{nombre: "some nombre"}
  @update_attrs %{nombre: "some updated nombre"}
  @invalid_attrs %{nombre: nil}

  def fixture(:autor) do
    {:ok, autor} = HelperAutor.create_autor(@create_attrs)
    autor
  end

  describe "index" do
    test "lists all autor", %{conn: conn} do
      conn = get(conn, Routes.autor_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Autor"
    end
  end

  describe "new autor" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.autor_path(conn, :new))
      assert html_response(conn, 200) =~ "New Autor"
    end
  end

  describe "create autor" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.autor_path(conn, :create), autor: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.autor_path(conn, :show, id)

      conn = get(conn, Routes.autor_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Autor"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.autor_path(conn, :create), autor: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Autor"
    end
  end

  describe "edit autor" do
    setup [:create_autor]

    test "renders form for editing chosen autor", %{conn: conn, autor: autor} do
      conn = get(conn, Routes.autor_path(conn, :edit, autor))
      assert html_response(conn, 200) =~ "Edit Autor"
    end
  end

  describe "update autor" do
    setup [:create_autor]

    test "redirects when data is valid", %{conn: conn, autor: autor} do
      conn = put(conn, Routes.autor_path(conn, :update, autor), autor: @update_attrs)
      assert redirected_to(conn) == Routes.autor_path(conn, :show, autor)

      conn = get(conn, Routes.autor_path(conn, :show, autor))
      assert html_response(conn, 200) =~ "some updated nombre"
    end

    test "renders errors when data is invalid", %{conn: conn, autor: autor} do
      conn = put(conn, Routes.autor_path(conn, :update, autor), autor: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Autor"
    end
  end

  describe "delete autor" do
    setup [:create_autor]

    test "deletes chosen autor", %{conn: conn, autor: autor} do
      conn = delete(conn, Routes.autor_path(conn, :delete, autor))
      assert redirected_to(conn) == Routes.autor_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.autor_path(conn, :show, autor))
      end
    end
  end

  defp create_autor(_) do
    autor = fixture(:autor)
    %{autor: autor}
  end
end
