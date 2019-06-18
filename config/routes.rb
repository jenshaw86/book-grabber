Rails.application.routes.draw do
  resources :books, only: [:index, :show]
  
  resources :users, only: [:show, :new, :create]
  
  resources :transactions, only: [:new, :create]
end
