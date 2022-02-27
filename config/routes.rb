Rails.application.routes.draw do
  resources :facilities
  resources :users, only: %i[edit update]
  resources :cars
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'facilities#index'
end
