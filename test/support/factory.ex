defmodule Examen.Test.Support.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: MyApp.Repo
  alias Examen.HelperLibro.Libro
  alias Examen.HelperBiblioteca.Biblioteca
  alias Examen.HelperAutor.Autor

  def libro_factory do
    %Libro{
      nombre: "100 años de soledad",
      biblioteca: build(:biblioteca),
      autor: build(:autor)
    }
  end

  def autor_factory do
    %Autor{
      nombre: "Gabriel Garcia Marquez",
      libros: build(:libros),
    }
  end

  def biblioteca_factory do
    %Biblioteca{
      nombre: "Biblioteca central",
      libros: build(:libros),
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
