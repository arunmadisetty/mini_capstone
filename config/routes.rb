Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/knicksgear" => "products#index"
  get "/knicksgear/new" => "products#new"
  post "/knicksgear" => "products#create"
  get "/knicksgear/:id" => "products#show"
  get "/knicksgear/:id/edit" => "products#edit"
  patch "/knicksgear/:id" => "products#update"
  delete "/knicksgear/:id" => "products#destroy"
  
end
