# defmodule ExamenTest do
#   use ExUnit.Case
#   use Examen.DataCase

#   doctest Examen

#   alias Examen.HelperAutor.Autor

#   describe "biblioteca/1" do
#     setup do
#       autor = insert(:autor)
#       libro = insert(:libro, autor: autor)
#       {:ok, autor: autor}
#     end

#     test "get_autor/1 list one autor from libro", %{autor: autor} do
#       HelperAutor.update_autor(autor, %{nombre: "Shakspare"})
#       assert HelperAutor.get_autor(autor.id) == "Shakspare"
#     end
#   end
# end
