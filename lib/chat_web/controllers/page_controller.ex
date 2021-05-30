defmodule ChatWeb.PageController do
  use ChatWeb, :controller
  alias Chat.Chats

  def index(conn, _params) do
    mensagens = Chats.list_mensagens()
    render(conn, "index.html", mensagens: mensagens)
  end
end
