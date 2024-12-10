Rails.application.routes.draw do
  root to: 'posts#index'

  resources :top_screen, only: [:index]
  resources :posts
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
