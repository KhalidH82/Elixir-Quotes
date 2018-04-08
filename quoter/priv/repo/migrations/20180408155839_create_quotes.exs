defmodule Quoter.Repo.Migrations.CreateQuotes do
  use Ecto.Migration

  def change do
    create table(:quotes) do
      add :author, :string
      add :body, :string

      timestamps()
    end

  end
end
