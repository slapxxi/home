defmodule Home.LayoutView do
  use Home.Web, :view

  import Home.URI
  import Home.HTML

  def author do
    [
      twitter: https("twitter.com/SlavaPavlutin"),
      github: https("github.com/slavapavlutin"),
      email: mail("sl.pavlutin"),
      name: "Slava Pavlutin",
      location: "Saint Petersburg",
    ]
  end

  def links do
    [
      elixir: http("elixir-lang.com"),
      phoenix: http("phoenixframework.org"),
    ]
  end

  defp mail(string) do
    "mailto:#{string}@gmail.com"
  end
end
