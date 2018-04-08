defmodule QuoterWeb.PageController do
  use QuoterWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
