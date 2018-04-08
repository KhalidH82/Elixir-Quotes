defmodule Quoter.Information do
alias Quoter.Repo
alias Quoter.Information.Quote

  def list_quotes do
  Repo.all(Quote)
  end

  def change_quote(%Quote{} = quote) do
  Quote.changeset(quote, %{})
end



end