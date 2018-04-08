defmodule QuoterWeb.QuoteController do
use QuoterWeb, :controller

def index(conn, _params) do
  quotes = Quoter.Information.list_quotes()
  render conn, "index.html", quotes: quotes
end



end