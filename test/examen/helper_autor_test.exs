# defmodule Examen.HelperAutorTest do
#   use Examen.DataCase

#   alias Examen.HelperAutor

#   describe "autor" do
#     alias Examen.HelperAutor.Autor

#     @valid_attrs %{nombre: "Rafael Pombo"}
#     @update_attrs %{nombre: "Jorge Isaacs"}
#     @invalid_attrs %{nombre: nil}

#     def autor_fixture(attrs \\ %{}) do
#       {:ok, autor} =
#         attrs
#         |> Enum.into(@valid_attrs)
#         |> HelperAutor.create_autor()

#       autor
#     end

#     test "list_autor/0 returns all autor" do
#       autor = autor_fixture()
#       assert HelperAutor.list_autor() == [autor]
#     end

#     test "get_autor!/1 returns the autor with given id" do
#       autor = autor_fixture()
#       assert HelperAutor.get_autor!(autor.id) == autor
#     end

#     test "create_autor/1 with valid data creates a autor" do
#       assert {:ok, %Autor{} = autor} = HelperAutor.create_autor(@valid_attrs)
#       assert autor.nombre == "Rafael Pombo"
#     end

#     test "create_autor/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = HelperAutor.create_autor(@invalid_attrs)
#     end

#     test "update_autor/2 with valid data updates the autor" do
#       autor = autor_fixture()
#       assert {:ok, %Autor{} = autor} = HelperAutor.update_autor(autor, @update_attrs)
#       assert autor.nombre == "Jorge Isaacs"
#     end

#     test "update_autor/2 with invalid data returns error changeset" do
#       autor = autor_fixture()
#       assert {:error, %Ecto.Changeset{}} = HelperAutor.update_autor(autor, @invalid_attrs)
#       assert autor == HelperAutor.get_autor!(autor.id)
#     end

#     test "delete_autor/1 deletes the autor" do
#       autor = autor_fixture()
#       assert {:ok, %Autor{}} = HelperAutor.delete_autor(autor)
#       assert_raise Ecto.NoResultsError, fn -> HelperAutor.get_autor!(autor.id) end
#     end

#     test "change_autor/1 returns a autor changeset" do
#       autor = autor_fixture()
#       assert %Ecto.Changeset{} = HelperAutor.change_autor(autor)
#     end

#     test "get_autor!/1 returns the autor using joins" do
#       autor = autor_fixture()
#       IO.inspect(autor)
#       assert HelperAutor.get_all_by_autor(autor.id) == autor.nombre
#       # assert HelperAutor.get_all_by_autor(autor.id) == nil
#     end

#   end
# end

defmodule Examen.HelperAutorTest do
  # use ExUnit.Case
  use Examen.DataCase

  alias Examen.HelperAutor
  alias Examen.HelperLibro
  alias Examen.HelperBiblioteca

  alias Examen.HelperAutor.Autor
  alias Examen.HelperLibro.Libro
  alias Examen.HelperBiblioteca.Biblioteca

  describe "autor/1" do
    setup do
      autor = insert(:autor)
      # IO.inspect(autor)
      biblioteca = insert(:biblioteca)
      # IO.inspect(biblioteca)
      libro = insert(:libro, biblioteca: biblioteca, autor: autor)
      # IO.inspect(libro)

      {:ok, autor: autor, biblioteca: biblioteca, libro: libro}
    end

    test "update_autor/1 update autor", %{autor: autor} do
      name = "Shakespare"
      assert {:ok, %Autor{} = autor} = HelperAutor.update_autor(autor, %{nombre: name})
      assert autor.nombre == name
    end

    # test "update_libro/1 update libro", %{libro: libro} do
    #   name = "Romero y Julieta"
    #   assert {:ok, %Libro{} = libro} = HelperAutor.update_libro(libro, %{nombre: name})
    #   assert libro.nombre == name
    # end

    # test "update_biblioteca/1 update biblioteca", %{biblioteca: biblioteca} do
    #   name = "Romero y Julieta"
    #   assert {:ok, %Biblioteca{} = biblioteca} = HelperAutor.update_biblioteca(biblioteca, %{nombre: name})
    #   assert biblioteca.nombre == name
    # end
  end
end
