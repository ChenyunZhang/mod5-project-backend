Rails.application.routes.draw do
  post "/login", to: "users#login"
  post "/users", to: "users#create"
  get "/users", to: "users#index"
  get "/keep_logged_in", to: "users#keep_logged_in"
  patch "/patch/:id", to: "users#update"

  get "/posts", to: "posts#index"
  post "/posts", to: "posts#create"
  delete "/posts/:id", to: "posts#destroy"

  get "/categories", to: "categories#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
