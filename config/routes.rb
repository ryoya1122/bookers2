Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show]
  resources :users, only: [:show, :edit, :index, :update]
end
