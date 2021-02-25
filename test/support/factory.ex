Examen.Test.Support.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: MyApp.Repo
  alias Examen.Helpers.Libro

  def libro_factory do
    %Libro{
      nombre: "100 años de soledad",
      autor: sequence(:Autor, [])
    }
  end
end
