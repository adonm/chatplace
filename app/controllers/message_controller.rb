class MessageController < ApplicationController
  def index
    @messages = Chatmessage.all
  end
end
