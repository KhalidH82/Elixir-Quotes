defmodule QuoterWeb.SessionController do
  use QuoterWeb, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

 def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
  case Quoter.Auth.sign_in(email, password) do
    {:ok, user} ->
      conn
      |> put_session(:current_user_id, user.id)
      |> put_flash(:info, "You have successfully signed in!")
      |> redirect(to: quote_path(conn, :index))

    {:error, _reason} ->
      conn
      |> put_flash(:error, "Invalid Email or Password")
      |> render("new.html")
  end
end

def delete(conn, _params) do
  conn
  |> Quoter.Auth.sign_out()
  |> redirect(to: quote_path(conn, :index))
end

end