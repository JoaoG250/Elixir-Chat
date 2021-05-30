defmodule Chat.Repo.Migrations.CreateMensagens do
  use Ecto.Migration

  def change do
    create table(:mensagens) do
      add :nome, :string
      add :texto, :text

      timestamps()
    end

  end
end
