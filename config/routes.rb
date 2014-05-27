ChatPlace::Application.routes.draw do
  devise_for :users, controllers: {sessions: "sessions"}
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  resources :channels, :chatmessages
  root to: 'message#index'
end
