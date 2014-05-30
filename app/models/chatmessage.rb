class Chatmessage < ActiveRecord::Base
    def to_s
        "#{chatroom} #{time} #{user.email}: #{body}"
    end
    validates_presence_of :time, :user_id, :chatroom_id, :body
end
