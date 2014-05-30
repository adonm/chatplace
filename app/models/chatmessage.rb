class Chatmessage < ActiveRecord::Base
    def to_s
        "#{channel} #{time} #{user.email}: #{body}"
    end
    validates_presence_of :time, :user_id, :channel_id, :body
end
