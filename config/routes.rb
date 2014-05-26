ChatPlace::Application.routes.draw do
  devise_for :users, controllers: {sessions: "sessions"}
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  root to: 'message#index'
end
