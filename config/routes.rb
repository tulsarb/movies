# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end

  post '/graphql', to: 'graphql#execute'
  devise_for :users
  root to: 'movies#index'

  resources :movies, only: %i[index show] do
    member do
      get 'favorite'
    end
  end
end
