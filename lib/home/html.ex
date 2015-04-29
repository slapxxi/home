defmodule Home.HTML do
  import Phoenix.HTML.Link, only: [link: 2]

  def smart_link(conn, text, options) do
    {to, opts} = Keyword.pop(options, :to)
    path = Plug.Conn.full_path(conn)
    do_smart_link(path, to, text, opts)
  end

  defp do_smart_link(path, path, text, options) do
    link(text, [to: "#", class: "active"] ++ options)
  end

  defp do_smart_link(path, to, text, options) do
    link(text, [to: to] ++ options)
  end
end
