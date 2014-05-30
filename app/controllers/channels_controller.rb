class ChannelsController < CrudController
    self.permitted_attrs = [:user_id, :name, :longitude, :latitude]
end
