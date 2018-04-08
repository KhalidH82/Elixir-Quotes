defmodule QuoterWeb.QuoteController do
use QuoterWeb, :controller
  alias Quoter.Information.Quote
  alias Quoter.Repo

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

def show(conn, %{"id" => id}) do
  quote = Quoter.Repo.get!(Quote, id)
  render(conn, "show.html", quote: quote)
end

def edit(conn, %{"id" => id}) do
  quote = Quoter.Repo.get!(Quote, id)
  changeset = Quoter.Information.change_quote(quote)
  render(conn, "edit.html", quote: quote, changeset: changeset)
end

def update(conn, %{"id" => id, "quote" => quote_params}) do
  quote = Quoter.Repo.get!(Quote, id)

  quote
  |> Quote.changeset(quote_params)
  |> Quoter.Repo.update()
  |> case do
    {:ok, quote} ->
      conn
      |> put_flash(:info, "Quote updated successfully.")
      |> redirect(to: quote_path(conn, :show, quote))
    {:error, %Ecto.Changeset{} = changeset} ->
      render(conn, "edit.html", quote: quote, changeset: changeset)
  end
end

def delete(conn, %{"id" => id}) do
  quote = Quoter.Repo.get!(Quote, id)
  {:ok, _quote} = Quoter.Repo.delete(quote)

  conn
  |> put_flash(:info, "Quote deleted successfully.")
  |> redirect(to: quote_path(conn, :index))
end

end