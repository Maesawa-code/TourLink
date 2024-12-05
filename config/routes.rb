Rails.application.routes.draw do
  root to: 'top_screen#index'
  devise_for :users, controllers: {
  registrations: 'users/registrations'
}

 
end
