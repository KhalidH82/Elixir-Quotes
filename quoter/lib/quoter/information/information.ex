defmodule Quoter.Information do
alias Quoter.Repo
alias Quoter.Information.Quote

  def list_quotes do
  Repo.all(Quote)
  end


end