Rails.application.routes.draw do
<<<<<<< HEAD
  get "accounts/index"
=======
>>>>>>> 0813f8c (Added Home page with proper routing, Added login page, added backgrounds and learned a little CSS. 10/4/24)
  get "pages/home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  root "pages#home"


  # Using the resources helper to specify routes we want available
  # We are going to have two Controllers we need to create routes for: session and users. We will be using the sessions to handle the session
  # actions of logging in and out. The users will be in charge of the actual user data for things like creating and editing new users.
  resources :users, only: [ :new, :create, :edit, :update, :show, :destroy ]

  get "/login", to: "sessions#login"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  get "/logout", to: "sessions#destroy"
  get "accounts", to: "accounts#index"
end
