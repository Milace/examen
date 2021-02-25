defmodule Examen.HelperLibroTest do
  use Examen.DataCase

  alias Examen.HelperLibro

  describe "libro" do
    alias Examen.HelperLibro.Libro

    @valid_attrs %{nombre: "some nombre"}
    @update_attrs %{nombre: "some updated nombre"}
    @invalid_attrs %{nombre: nil}

    def libro_fixture(attrs \\ %{}) do
      {:ok, libro} =
        attrs
        |> Enum.into(@valid_attrs)
        |> HelperLibro.create_libro()

      libro
    end

    test "list_libro/0 returns all libro" do
      libro = libro_fixture()
      assert HelperLibro.list_libro() == [libro]
    end

    test "get_libro!/1 returns the libro with given id" do
      libro = libro_fixture()
      assert HelperLibro.get_libro!(libro.id) == libro
    end

    test "create_libro/1 with valid data creates a libro" do
      assert {:ok, %Libro{} = libro} = HelperLibro.create_libro(@valid_attrs)
      assert libro.nombre == "some nombre"
    end

    test "create_libro/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = HelperLibro.create_libro(@invalid_attrs)
    end

    test "update_libro/2 with valid data updates the libro" do
      libro = libro_fixture()
      assert {:ok, %Libro{} = libro} = HelperLibro.update_libro(libro, @update_attrs)
      assert libro.nombre == "some updated nombre"
    end

    test "update_libro/2 with invalid data returns error changeset" do
      libro = libro_fixture()
      assert {:error, %Ecto.Changeset{}} = HelperLibro.update_libro(libro, @invalid_attrs)
      assert libro == HelperLibro.get_libro!(libro.id)
    end

    test "delete_libro/1 deletes the libro" do
      libro = libro_fixture()
      assert {:ok, %Libro{}} = HelperLibro.delete_libro(libro)
      assert_raise Ecto.NoResultsError, fn -> HelperLibro.get_libro!(libro.id) end
    end

    test "change_libro/1 returns a libro changeset" do
      libro = libro_fixture()
      assert %Ecto.Changeset{} = HelperLibro.change_libro(libro)
    end
  end
end
