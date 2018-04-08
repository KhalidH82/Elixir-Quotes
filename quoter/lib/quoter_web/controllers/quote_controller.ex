defmodule QuoterWeb.QuoteController do
use QuoterWeb, :controller

def index(conn, _params) do
  quotes = Quoter.Information.list_quotes()
  render conn, "index.html", quotes: quotes
end

def new(conn, _params) do
  alias Quoter.Information.Quote
  changeset = Quote.changeset(%Quote{}, %{})
  render conn, "new.html", changeset: changeset
end

def create(conn, %{"quote" => quote_params}) do
  alias Quoter.Information.Quote
  alias Quoter.Repo
  %Quote{}
  |> Quote.changeset(quote_params)
  |> Repo.insert()
  |> case do
    {:ok, quote} ->
      conn
      |> put_flash(:info, "Quote created successfully.")
      |> redirect(to: quote_path(conn, :index))

    {:error, %Ecto.Changeset{} = changeset} ->
      render(conn, "new.html", changeset: changeset)
  end
end

def show(conn, _params) do
  render conn, "show.html"
end

end