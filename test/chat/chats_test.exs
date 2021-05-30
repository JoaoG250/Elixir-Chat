defmodule Chat.ChatsTest do
  use Chat.DataCase

  alias Chat.Chats

  describe "mensagens" do
    alias Chat.Chats.Mensagem

    @valid_attrs %{nome: "some nome", texto: "some texto"}
    @update_attrs %{nome: "some updated nome", texto: "some updated texto"}
    @invalid_attrs %{nome: nil, texto: nil}

    def mensagem_fixture(attrs \\ %{}) do
      {:ok, mensagem} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Chats.create_mensagem()

      mensagem
    end

    test "list_mensagens/0 returns all mensagens" do
      mensagem = mensagem_fixture()
      assert Chats.list_mensagens() == [mensagem]
    end

    test "get_mensagem!/1 returns the mensagem with given id" do
      mensagem = mensagem_fixture()
      assert Chats.get_mensagem!(mensagem.id) == mensagem
    end

    test "create_mensagem/1 with valid data creates a mensagem" do
      assert {:ok, %Mensagem{} = mensagem} = Chats.create_mensagem(@valid_attrs)
      assert mensagem.nome == "some nome"
      assert mensagem.texto == "some texto"
    end

    test "create_mensagem/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chats.create_mensagem(@invalid_attrs)
    end

    test "update_mensagem/2 with valid data updates the mensagem" do
      mensagem = mensagem_fixture()
      assert {:ok, %Mensagem{} = mensagem} = Chats.update_mensagem(mensagem, @update_attrs)
      assert mensagem.nome == "some updated nome"
      assert mensagem.texto == "some updated texto"
    end

    test "update_mensagem/2 with invalid data returns error changeset" do
      mensagem = mensagem_fixture()
      assert {:error, %Ecto.Changeset{}} = Chats.update_mensagem(mensagem, @invalid_attrs)
      assert mensagem == Chats.get_mensagem!(mensagem.id)
    end

    test "delete_mensagem/1 deletes the mensagem" do
      mensagem = mensagem_fixture()
      assert {:ok, %Mensagem{}} = Chats.delete_mensagem(mensagem)
      assert_raise Ecto.NoResultsError, fn -> Chats.get_mensagem!(mensagem.id) end
    end

    test "change_mensagem/1 returns a mensagem changeset" do
      mensagem = mensagem_fixture()
      assert %Ecto.Changeset{} = Chats.change_mensagem(mensagem)
    end
  end
end
