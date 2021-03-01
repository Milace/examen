defmodule Examen.Factory do
  use ExMachina.Ecto, repo: Examen.Repo
  alias Examen.HelperLibro.Libro
  alias Examen.HelperBiblioteca.Biblioteca
  alias Examen.HelperAutor.Autor

  def autor_factory do
    %Autor{
      nombre: "Gabriel Garcia Marquez"
      # libros: build(:libro),
    }
  end

  def biblioteca_factory do
    %Biblioteca{
      nombre: "Biblioteca central"
      # libros: build(:libro),
    }
  end

  def libro_factory do
    %Libro{
      nombre: "100 años de soledad",
      biblioteca: build(:biblioteca),
      autor: build(:autor)
    }
  end

  # # derived factory
  # def featured_article_factory do
  #   struct!(
  #     article_factory(),
  #     %{
  #       featured: true,
  #     }
  #   )
  # end

  # def comment_factory do
  #   %MyApp.Comment{
  #     text: "It's great!",
  #     article: build(:article),
  #   }
  # end
end
