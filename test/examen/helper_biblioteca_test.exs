defmodule Examen.HelperBibliotecaTest do
  use Examen.DataCase

  alias Examen.HelperBiblioteca

  describe "biblioteca" do
    alias Examen.HelperBiblioteca.Biblioteca

    @valid_attrs %{nombre: "some nombre"}
    @update_attrs %{nombre: "some updated nombre"}
    @invalid_attrs %{nombre: nil}

    def biblioteca_fixture(attrs \\ %{}) do
      {:ok, biblioteca} =
        attrs
        |> Enum.into(@valid_attrs)
        |> HelperBiblioteca.create_biblioteca()

      biblioteca
    end

    test "list_biblioteca/0 returns all biblioteca" do
      biblioteca = biblioteca_fixture()
      assert HelperBiblioteca.list_biblioteca() == [biblioteca]
    end

    test "get_biblioteca!/1 returns the biblioteca with given id" do
      biblioteca = biblioteca_fixture()
      assert HelperBiblioteca.get_biblioteca!(biblioteca.id) == biblioteca
    end

    test "create_biblioteca/1 with valid data creates a biblioteca" do
      assert {:ok, %Biblioteca{} = biblioteca} = HelperBiblioteca.create_biblioteca(@valid_attrs)
      assert biblioteca.nombre == "some nombre"
    end

    test "create_biblioteca/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = HelperBiblioteca.create_biblioteca(@invalid_attrs)
    end

    test "update_biblioteca/2 with valid data updates the biblioteca" do
      biblioteca = biblioteca_fixture()
      assert {:ok, %Biblioteca{} = biblioteca} = HelperBiblioteca.update_biblioteca(biblioteca, @update_attrs)
      assert biblioteca.nombre == "some updated nombre"
    end

    test "update_biblioteca/2 with invalid data returns error changeset" do
      biblioteca = biblioteca_fixture()
      assert {:error, %Ecto.Changeset{}} = HelperBiblioteca.update_biblioteca(biblioteca, @invalid_attrs)
      assert biblioteca == HelperBiblioteca.get_biblioteca!(biblioteca.id)
    end

    test "delete_biblioteca/1 deletes the biblioteca" do
      biblioteca = biblioteca_fixture()
      assert {:ok, %Biblioteca{}} = HelperBiblioteca.delete_biblioteca(biblioteca)
      assert_raise Ecto.NoResultsError, fn -> HelperBiblioteca.get_biblioteca!(biblioteca.id) end
    end

    test "change_biblioteca/1 returns a biblioteca changeset" do
      biblioteca = biblioteca_fixture()
      assert %Ecto.Changeset{} = HelperBiblioteca.change_biblioteca(biblioteca)
    end
  end
end
