class RealtimeMessageController < FayeRails::Controller
  channel '/message/**' do
    subscribe do
      Rails.logger.debug "Received on #{channel}: #{inspect}"
      user = User.find_by email: message['email']
      chatroom = Chatroom.find(message['channel'])
      Chatmessage.create(user: user, chatroom: chatroom, body: message['body'], time: Time.now)
    end
  end
end
