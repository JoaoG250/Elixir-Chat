defmodule Chat.Chats do
  @moduledoc """
  The Chats context.
  """

  import Ecto.Query, warn: false
  alias Chat.Repo

  alias Chat.Chats.Mensagem

  @doc """
  Returns the list of mensagens.

  ## Examples

      iex> list_mensagens()
      [%Mensagem{}, ...]

  """
  def list_mensagens do
    Repo.all(Mensagem)
  end

  @doc """
  Gets a single mensagem.

  Raises `Ecto.NoResultsError` if the Mensagem does not exist.

  ## Examples

      iex> get_mensagem!(123)
      %Mensagem{}

      iex> get_mensagem!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mensagem!(id), do: Repo.get!(Mensagem, id)

  @doc """
  Creates a mensagem.

  ## Examples

      iex> create_mensagem(%{field: value})
      {:ok, %Mensagem{}}

      iex> create_mensagem(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mensagem(attrs \\ %{}) do
    %Mensagem{}
    |> Mensagem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a mensagem.

  ## Examples

      iex> update_mensagem(mensagem, %{field: new_value})
      {:ok, %Mensagem{}}

      iex> update_mensagem(mensagem, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_mensagem(%Mensagem{} = mensagem, attrs) do
    mensagem
    |> Mensagem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a mensagem.

  ## Examples

      iex> delete_mensagem(mensagem)
      {:ok, %Mensagem{}}

      iex> delete_mensagem(mensagem)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mensagem(%Mensagem{} = mensagem) do
    Repo.delete(mensagem)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mensagem changes.

  ## Examples

      iex> change_mensagem(mensagem)
      %Ecto.Changeset{data: %Mensagem{}}

  """
  def change_mensagem(%Mensagem{} = mensagem, attrs \\ %{}) do
    Mensagem.changeset(mensagem, attrs)
  end
end
