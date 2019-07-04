Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :listings
  resources :orders, only: [:show, :new, :create, :update, :index]
  resources :books, only: [:index, :show, :new, :create]
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  get "/profile", to: "users#show"
  post "/sessions", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/checkout", to: "orders#checkout"
  root "users#main"

  post "/signup", to: "users#new"
  post "/profile", to: "users#show"
  post "/logout", to: "sessions#destroy"
  post "/login", to: "sessions#new"
end
