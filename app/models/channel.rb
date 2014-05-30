class Channel < ActiveRecord::Base
    def to_s
        "#{name}"
    end

    before_validation :update_params

    def update_params
        self.user = User.current_user
    end

    validates_presence_of :user_id, :name, :longitude, :latitude
end
