Rails.application.routes.draw do
  resources :sessions
  post "/password_resets", to: "password_resets#create"
  post "/reset_password", to: "password_resets#update"

  get "/google_login", to: redirect("/auth/google_oauth2")
  get "/google_logout", to: "sessions#destroy"
  get "/auth/google_oauth2/callback", to: "sessions#create"
  get 'auth/failure', to: redirect('/')
  resource :session, only: [:create, :destroy]

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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
