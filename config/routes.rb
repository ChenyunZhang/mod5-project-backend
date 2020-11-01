Rails.application.routes.draw do
  post "/login", to: "users#login"
  post "/users", to: "users#create"
  get "/users", to: "users#index"
  get "/user/:id", to: "users#show"
  get "/keep_logged_in", to: "users#keep_logged_in"
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy"

  get "/posts", to: "posts#index"
  post "/posts", to: "posts#create"
  delete "/posts/:id", to: "posts#destroy"

  get "/categories", to: "categories#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
