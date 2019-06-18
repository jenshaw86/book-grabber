Rails.application.routes.draw do
  resources :books, only: [:index, :show]
  
  resources :users, only: [:show]
  
  resources :transactions, only: [:new, :create]
end
