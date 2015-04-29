defmodule Home.URI do
  def join([]) do
    "/"
  end

  def join(segments) do
    "/#{segments |> Enum.join("/")}"
  end

  def http(url) do
    "http://#{url}"
  end

  def https(url) do
    "https://#{url}"
  end
end
