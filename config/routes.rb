ChatPlace::Application.routes.draw do
  devise_for :users, controllers: {sessions: "sessions"}
  resources :chatrooms, :chatmessages, :users
  root to: 'layouts#index'
end
