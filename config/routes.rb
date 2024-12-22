Rails.application.routes.draw do
  root to: 'posts#index'

  resources :top_screen, only: [:index]
  resources :posts do
    resources :comments, only: :create
  end  
  resources :users
  resources :reviews
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
