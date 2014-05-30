class ChatmessagesController < CrudController
    self.permitted_attrs = [:body]
end
