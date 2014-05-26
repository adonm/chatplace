class MessageController < ApplicationController
  def index
    @chat_messages = ChatMessage.find
  end
end
