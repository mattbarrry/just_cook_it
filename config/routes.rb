# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'dashboards#show'

  # Resourceful routes
  resource :recipes, only: [:show]
  resource :login, only: %i[new create]
  resource :privacy_policy, only: [:show]

  # Named routes
  get '/logout', to: 'logins#destroy'
  get '/auth/:provider/callback', to: 'auth#omniauth'

  # Lookbook for later
  mount Lookbook::Engine, at: '/lookbook' if Rails.env.development?
end
