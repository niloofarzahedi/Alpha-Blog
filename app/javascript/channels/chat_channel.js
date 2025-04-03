// app/javascript/channels/chat_channel.js
import consumer from "./consumer"

consumer.subscriptions.create(
  { channel: "ChatChannel", chat_id: 1 },
  {
    connected() {
      console.log("Connected to ChatChannel")
    },
    received(data) {
      console.log("Received:", data)
    }
  }
)
