Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: 'posts#index'
  
  resources :requests do
    member do
      patch :approve
      patch :reject
    end
  end
  resources :top_screen, only: [:index]
  resources :posts do
    resources :comments, only: :create
    resources :requests, only: :create 
      
    end
  resources :users do
    resources :reviews
  end
end
