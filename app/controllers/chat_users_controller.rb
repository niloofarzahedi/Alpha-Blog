class ChatUsersController < ApplicationController

  # Require authentication before any action in this controller
  before_action :authenticate_user!
  before_action :set_chat

  def create
    # Find or create a chat user record for the current user in the specified chat
    @chat_user = @chat.chat_users.where(user_id: current_user.id).first_or_create
    redirect_to @chat
  end

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end
end
