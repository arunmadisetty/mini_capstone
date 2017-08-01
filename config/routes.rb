Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/knicksgear" => "products#index"
  get "/knicksgear/new" => "products#new"
  post "/knicksgear" => "products#create"
  get "/knicksgear/:id" => "products#show"
  get "/knicksgear/:id/edit" => "products#edit"
  patch "/knicksgear/:id" => "products#update"
  delete "/knicksgear/:id" => "products#destroy"

  get "/signup" => "users#new"  
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"

  get "/carted_products" => "carted_products#index"
  post "/carted_products" => "carted_products#create"
  get "/carted_products/:id" => "carted_products#show"

end