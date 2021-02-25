defmodule Examen.HelperAutorTest do
  use Examen.DataCase

  alias Examen.HelperAutor

  describe "autor" do
    alias Examen.HelperAutor.Autor

    @valid_attrs %{nombre: "some nombre"}
    @update_attrs %{nombre: "some updated nombre"}
    @invalid_attrs %{nombre: nil}

    def autor_fixture(attrs \\ %{}) do
      {:ok, autor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> HelperAutor.create_autor()

      autor
    end

    test "list_autor/0 returns all autor" do
      autor = autor_fixture()
      assert HelperAutor.list_autor() == [autor]
    end

    test "get_autor!/1 returns the autor with given id" do
      autor = autor_fixture()
      assert HelperAutor.get_autor!(autor.id) == autor
    end

    test "create_autor/1 with valid data creates a autor" do
      assert {:ok, %Autor{} = autor} = HelperAutor.create_autor(@valid_attrs)
      assert autor.nombre == "some nombre"
    end

    test "create_autor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = HelperAutor.create_autor(@invalid_attrs)
    end

    test "update_autor/2 with valid data updates the autor" do
      autor = autor_fixture()
      assert {:ok, %Autor{} = autor} = HelperAutor.update_autor(autor, @update_attrs)
      assert autor.nombre == "some updated nombre"
    end

    test "update_autor/2 with invalid data returns error changeset" do
      autor = autor_fixture()
      assert {:error, %Ecto.Changeset{}} = HelperAutor.update_autor(autor, @invalid_attrs)
      assert autor == HelperAutor.get_autor!(autor.id)
    end

    test "delete_autor/1 deletes the autor" do
      autor = autor_fixture()
      assert {:ok, %Autor{}} = HelperAutor.delete_autor(autor)
      assert_raise Ecto.NoResultsError, fn -> HelperAutor.get_autor!(autor.id) end
    end

    test "change_autor/1 returns a autor changeset" do
      autor = autor_fixture()
      assert %Ecto.Changeset{} = HelperAutor.change_autor(autor)
    end
  end
end
