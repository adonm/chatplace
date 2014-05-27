class RealtimeMessageController < FayeRails::Controller
  channel '/message/**' do
    subscribe do
      Rails.logger.debug "Received on #{channel}: #{inspect}"

      created_at = if message['created_at'] && message['created_at'].size > 0
                     Time.parse(message['created_at'])
                   else
                     Time.now
                   end

      Chatmessage.create(body: message['message'], time: created_at)
    end
  end
end
