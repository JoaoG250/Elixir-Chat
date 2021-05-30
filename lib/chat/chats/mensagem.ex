defmodule Chat.Chats.Mensagem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mensagens" do
    field :nome, :string
    field :texto, :string

    timestamps()
  end

  @doc false
  def changeset(mensagem, attrs) do
    mensagem
    |> cast(attrs, [:nome, :texto])
    |> validate_required([:nome, :texto])
  end
end
