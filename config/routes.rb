Rails.application.routes.draw do
  devise_for :users
  root to: 'movies#index'

  resources :movies, only: [:index, :show] do
    member do
      get 'favorite'
    end
  end
end
