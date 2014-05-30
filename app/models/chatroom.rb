class Chatroom < ActiveRecord::Base
    def to_s
        "#{name}"
    end

    before_validation :default_params

    def default_params
      self.user = User.current_user
    end

    validates_presence_of :user_id, :name, :longitude, :latitude
end
