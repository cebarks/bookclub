Rails.application.routes.draw do
  resources :users, only: [:show, :index, :destroy, :new]
  resources :authors, only: [:show, :index, :edit, :destroy, :new]
  resources :reviews, only: [:show, :index, :edit, :destroy, :new, :create]
  resources :books, only: [:show, :index, :new, :create, :edit, :destroy, :new]
  resources :welcome, only: [:index]

  root 'welcome#index'
end
