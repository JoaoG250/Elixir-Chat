defmodule ChatWeb.LiveChatChannel do
  use ChatWeb, :channel
  alias Chat.Chats

  def join("live_chat:lobby", _payload, socket) do
    {:ok, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (live_chat:lobby).
  def handle_in("shout", payload, socket) do
    Chats.create_mensagem(payload)
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end
end
