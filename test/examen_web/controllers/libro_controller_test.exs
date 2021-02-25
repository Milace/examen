defmodule ExamenWeb.LibroControllerTest do
  use ExamenWeb.ConnCase

  alias Examen.HelperLibro

  @create_attrs %{nombre: "some nombre"}
  @update_attrs %{nombre: "some updated nombre"}
  @invalid_attrs %{nombre: nil}

  def fixture(:libro) do
    {:ok, libro} = HelperLibro.create_libro(@create_attrs)
    libro
  end

  describe "index" do
    test "lists all libro", %{conn: conn} do
      conn = get(conn, Routes.libro_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Libro"
    end
  end

  describe "new libro" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.libro_path(conn, :new))
      assert html_response(conn, 200) =~ "New Libro"
    end
  end

  describe "create libro" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.libro_path(conn, :create), libro: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.libro_path(conn, :show, id)

      conn = get(conn, Routes.libro_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Libro"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.libro_path(conn, :create), libro: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Libro"
    end
  end

  describe "edit libro" do
    setup [:create_libro]

    test "renders form for editing chosen libro", %{conn: conn, libro: libro} do
      conn = get(conn, Routes.libro_path(conn, :edit, libro))
      assert html_response(conn, 200) =~ "Edit Libro"
    end
  end

  describe "update libro" do
    setup [:create_libro]

    test "redirects when data is valid", %{conn: conn, libro: libro} do
      conn = put(conn, Routes.libro_path(conn, :update, libro), libro: @update_attrs)
      assert redirected_to(conn) == Routes.libro_path(conn, :show, libro)

      conn = get(conn, Routes.libro_path(conn, :show, libro))
      assert html_response(conn, 200) =~ "some updated nombre"
    end

    test "renders errors when data is invalid", %{conn: conn, libro: libro} do
      conn = put(conn, Routes.libro_path(conn, :update, libro), libro: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Libro"
    end
  end

  describe "delete libro" do
    setup [:create_libro]

    test "deletes chosen libro", %{conn: conn, libro: libro} do
      conn = delete(conn, Routes.libro_path(conn, :delete, libro))
      assert redirected_to(conn) == Routes.libro_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.libro_path(conn, :show, libro))
      end
    end
  end

  defp create_libro(_) do
    libro = fixture(:libro)
    %{libro: libro}
  end
end
