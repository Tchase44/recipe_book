Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # default_url_options host: Rails.env['HOST_URL']
  default_url_options host: "localhost:3000"

  # devise_for :users # <- pregenerated views

  devise_for :users, skip: [:sessions, :registrations, :passwords]
  as :user do
    post "/sign_up", to: "users/registrations#create", default: {format: :json}
    put  "/users/password", :to => "users/passwords#update", default: {format: :json}
    get "/user/username", to: "users/username#show", default: {format: :json}
    put "/user/username", to: "users/username#update", default: {format: :json}
    delete "/users", to: "users/registrations#destroy", default: {format: :json}
  end

  # login
  post 'auth_user', to: "authentication#authenticate_user"

  # resources :brands, only: [:index, :show] do
  #   resources :products, only: [:index, :show]
  # end

  resources :recipes do
    resources :ingredients
  end

  get "/health", to: "health#show", default: {format: :json}
  get "/health-check", to: "health#show", default: {format: :json}
  get "/health_check", to: "health#show", default: {format: :json}


  # root to: 'pages#main'
  # root 'pages#main' <- shortcut for above
  #
  # namespace :admin do
  #   root to: "admin#index"
  # end
  # root to: "home#index"
end
