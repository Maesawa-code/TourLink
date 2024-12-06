Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'
  resources :top_screen, only: [:index]
  resources :home, only: [:index] 
  devise_for :users, controllers: {
  registrations: 'users/registrations'
}

 
end
