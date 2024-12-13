Rails.application.routes.draw do
  root to: 'posts#index'

  resources :top_screen, only: [:index]
  resources :posts
  resources :users
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
