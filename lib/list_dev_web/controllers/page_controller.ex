defmodule ListDevWeb.PageController do
  use ListDevWeb, :controller

  def index(conn, _params) do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.get("https://reqres.in/api/users?page=2")
    IO.puts(body)
    IO.puts("_______________________________________________")
    entries=Poison.decode!(body)
    IO.inspect(entries["data"])
    # case HTTPoison.get("https://reqres.in/api/users?page=2") do
    #   {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
    #     IO.puts(body)
    #   {:ok, %HTTPoison.Response{status_code: 404}} ->
    #     IO.puts("Not found :(")
    #   {:error, %HTTPoison.Error{reason: reason}} ->
    #     IO.inspect(reason)
    # end
    render(conn, "index.html", entries: entries["data"])
  end
end
