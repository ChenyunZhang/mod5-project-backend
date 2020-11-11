Rails.application.routes.draw do
  resources :voteups
  resources :votedowns
  resources :books
  resources :sessions
  post "/password_resets", to: "password_resets#create"
  post "/reset_password", to: "password_resets#update"
  
  get "/auth/google_oauth2/callback", to: "sessions#GoogleAuth"
  post "/usersgoogle", to: "users#find_or_create"

  post "/login", to: "users#login"
  post "/users", to: "users#create"
  get "/users", to: "users#index"
  get "/user/:id", to: "users#show"
  get "/keep_logged_in", to: "users#keep_logged_in"
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy"

  get "/posts", to: "posts#index"
  post "/posts", to: "posts#create"
  patch "/posts/edit/:id", to: "posts#update"
  delete "/posts/:id", to: "posts#destroy"

  get "/categories", to: "categories#index"

  get "/books", to: "books#index"

  get "/voteups", to: "voteups#index"
  post "/voteups", to: "voteups#create"
  delete "/voteups/:id", to: "voteups#destroy"

  get "/votedowns", to: "votedowns#index"
  post "/votedowns", to: "votedowns#create"
  delete "/votedowns/:id", to: "votedowns#destroy"  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
