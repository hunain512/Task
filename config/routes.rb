Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: "pages#index"
  # get 'stores/mystore'
  # get 'stores/show'
  # get "/stores", to: "stores#index"
  # get "/stores", to: "stores#index"
  # get "/stores/new", to: "stores#new"
  # post "/stores/:id", to: "stores#create"
  # get "/stores/:id/edit", to: "stores#edit"
  # patch "/stores/:id", to: "stores#update"
  # get "/stores/:id", to: "stores#show"
  resources :stores
  # get "/users", to: "users#index"
  # get "/users/:id", to: "users#show"
  resources :users
  resources :categories
  resources :items
  post 'cart_items/:id/add' => "cart_items#add_quantity", as: "cart_item_add"
  post 'cart_items/:id/reduce' => "cart_items#reduce_quantity", as: "cart_item_reduce"
  get 'carts/:id' => "carts#show", as: "cart"
  post 'cart_items' => "cart_items#create"
  get 'cart_items/:id' => "cart_items#show", as: "cart_item"
  delete "cart_items/:id" => "cart_items#destroy" 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
