Rails.application.routes.draw do
  root to: 'posts#index'

  resources :top_screen, only: [:index]
  resources :posts
  resources :users, only: [:index]

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
