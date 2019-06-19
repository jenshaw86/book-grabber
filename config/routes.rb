Rails.application.routes.draw do
  resources :books, only: [:index, :show]
  
  resources :users, only: [:show, :new, :create]
  
  resources :transactions, only: [:new, :create]
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
end
