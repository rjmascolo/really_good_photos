Rails.application.routes.draw do

  root 'static#index'
  post 'login', to: "sessions#create", as: 'login'
  get 'sessions/destroy'

  resources :photos
  resources :usersphotos
  resources :users
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
