Rails.application.routes.draw do
  resources :statuses
  get 'log/index'
  devise_for :users
  resources :materials
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "materials#index"

  #get "home/about"
  # Defines the root path route ("/")
  # root "articles#index"
end
