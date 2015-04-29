defmodule Home.Post do
  defstruct [:title, :preview, :content, :date, :slug]

  @posts Path.absname("") <> "/web/static/posts"

  def all do
    @posts
    |> File.ls!
    |> Enum.map(&(@posts <> "/" <> &1))
    |> Enum.map(&File.read!/1)
    |> Enum.map(&parse/1)
  end

  def read(title) do
    {:ok, post} = File.read("web/static/posts/#{title}.md")
    parse post
  end

  def parse(post) do
    {first, last} = split(post)
    cont = content(last)
    tit = title(first)

    %__MODULE__{title: tit, content: cont, slug: slug(tit),
                preview: preview(cont)}
  end

  def title(text) do
    text
    |> String.replace("#", "")
    |> String.strip
  end

  def content(text) do
    Earmark.to_html(text)
  end

  def preview(content) do
    content
    |> String.split("</p>")
    |> List.first
    |> String.replace("<p>", "")
    |> String.strip
  end

  defp slug(binary) do
    binary
    |> String.downcase
    |> String.split
    |> Enum.join("-")
  end

  defp lines(text) do
    String.split(text, "\n")
  end

  defp split(text) do
    [h | t] = lines(text)
    {h, t}
  end
end
