Rails.application.routes.draw do
  resources :user_projects, only: [:index, :show, :create]
  resources :comments, only: [:index, :show, :create, :destroy]
  resources :relationships
  resources :posts, only: [:index, :show, :create]
  resources :technologies

  resources :projects, only: [:index, :show, :create]
  resources :users do
    get "/feed", to: "users#feed"
  end

  get '/user_images/:id', to: "users#images"
  
  post '/login', to: 'sessions#create'
  get '/me', to: 'users#show_me'
  delete '/logout', to: 'sessions#destroy'

  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
