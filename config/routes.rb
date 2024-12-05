Rails.application.routes.draw do
  root to: 'top_screen#index'
  resources :home, only: [:index] 
  devise_for :users, controllers: {
  registrations: 'users/registrations'
}

 
end
