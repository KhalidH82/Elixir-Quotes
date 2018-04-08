defmodule Quoter.Information.Quote do
  use Ecto.Schema
  import Ecto.Changeset


  schema "quotes" do
    field :author, :string
    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(quote, attrs) do
    quote
    |> cast(attrs, [:author, :body])
    |> validate_required([:author, :body])
  end
end
