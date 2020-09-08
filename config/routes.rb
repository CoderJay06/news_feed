Rails.application.routes.draw do
  get 'password/reset'
  post 'password/reset'
  get 'password/forgot'
  post 'password/forgot'
  
  resources :users
  get 'home/index'
  get 'home/login'
  get 'home/logout'
  post 'home/login'
  post 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
