Rails.application.routes.draw do
  resources :books, only: [:index, :show]
  
  resources :users, only: [:show, :new, :create]
  
  resources :transactions, only: [:new, :create]

  resources :authors, only: [:show]
  
  resources :genres, only: [:show]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  
  get "/tasks", to: "users#tasks"

  post "/accept", to: "transactions#accept"
  post "/decline", to: "transactions#decline"
end
