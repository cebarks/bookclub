Rails.application.routes.draw do
  resources :users
  resources :book_authors
  resources :authors
  resources :reviews
  resources :books
  resources :welcome

  root 'welcome#index'
end
