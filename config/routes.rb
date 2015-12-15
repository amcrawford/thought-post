Rails.application.routes.draw do
  root to: "welcome#index"

  resources :users

  get "/auth/twitter", as: :login

  get "/auth/twitter/callback", to: "sessions#create"

  get "/logout", to: "sessions#destroy"

end
