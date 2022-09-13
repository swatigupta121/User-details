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

  def edit(conn, _params) do
    render(conn, "edit.html")
  end

  def create(conn, params) do
    IO.puts("entered_______________________________________")
    IO.inspect(conn)
    IO.puts("+++++++++++++++++++++++++++++++++")
    IO.inspect(params)
    initial = %{name: params["name"], job: params["job"]}
    final = Poison.encode!(initial)
    IO.inspect(final)
    {:ok, resp} = HTTPoison.post("https://reqres.in/api/users",final)
    IO.puts("___________________________________________________________")
    IO.inspect(resp)
    # case HTTPoison.post("https://reqres.in/api/users",body) do
    #   {:ok, %HTTPoison.Response{status_code: 201, body: body}} ->
    #     IO.puts(body)
    #   {:ok, %HTTPoison.Response{status_code: 404}} ->
    #     IO.puts("Not found :(")
    #   {:error, %HTTPoison.Error{reason: reason}} ->
    #     IO.inspect(reason)
    # end
    render(conn, "success.html")

  end

  def update(conn, params) do
    IO.puts("entered update_______________________________________")
    IO.inspect(conn)
    IO.puts("+++++++++++++++++++++++++++++++++")
    IO.inspect(params)
    initial = %{name: params["name"], job: params["job"]}
    body = Poison.encode!(initial)
    IO.inspect(body)
    # {:ok, response} = HTTPoison.patch("https://reqres.in/api/users",body)
    IO.puts("___________________________________________________________")
    case HTTPoison.put("https://reqres.in/api/users/2",body) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts(body)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts("Not found :(")
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
    render(conn, "success.html")

  end

  def new(conn, params) do
    IO.puts("entered new_______________________________________")
    IO.inspect(conn)
    IO.puts("+++++++++++++++++++++++++++++++++")
    IO.inspect(params)
    render(conn, "new.html")
  end
end
