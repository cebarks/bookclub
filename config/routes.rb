Rails.application.routes.draw do
  # resources :users, only: [:show, :index, :destroy, :new]
  # resources :reviews, only: [:show, :index, :edit, :destroy, :new, :create]
  # resources :books, only: [:show, :index, :new, :create, :edit, :destroy, :new]
  # resources :authors, only: [:show, :index, :destroy, :new]
  # resources :welcome, only: [:index]

  get '/users', to: 'users#index', as: 'users'
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/:id', to: 'users#show', as: 'user'
  delete '/users/:id', to: 'users#destroy'

  get '/reviews', to: 'reviews#index', as: 'reviews'
  post '/reviews', to: 'reviews#create'
  get '/reviews/new', to: 'reviews#new', as: 'new_review'
  get '/reviews/:id/edit', to: 'reviews#edit', as: 'edit_review'
  get '/reviews/:id', to: 'reviews#show', as: 'review'
  delete '/reviews/:id', to: 'reviews#destroy'

  get '/books', to: 'books#index', as: 'books'
  post '/books', to: 'books#create'
  get '/books/new', to: 'books#new', as: 'new_book'
  get '/books/:id/edit', to: 'books#edit', as: 'edit_book'
  get '/books/:id', to: 'books#show', as: 'book'
  delete '/books/:id', to: 'books#destroy'

  get '/authors', to: 'authors#index', as: 'authors'
  get '/authors/new', to: 'authors#new', as: 'new_author'
  get '/authors/:id', to: 'authors#show', as: 'author'
  delete '/authors/:id', to: 'authors#destroy'

  get '/welcome', to: 'welcome#index'

  root 'welcome#index'
end
