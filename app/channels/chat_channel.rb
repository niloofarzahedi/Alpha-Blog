class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # Find the chat based on the chat_id parameter
    chat = Chat.find(params[:id])
    # Stream for the found chat
    # stream_for chat
    # Alternatively, you can use the following line to stream from a specific channel
    stream_from "chat_#{params[:id]}"
  rescue ActiveRecord::RecordNotFound
    # If the chat is not found, reject the subscription
    reject
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
