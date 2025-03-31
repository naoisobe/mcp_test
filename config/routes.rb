Rails.application.routes.draw do
  root 'home#index'
  
  # Authentication routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # OAuth routes
  get '/auth/:provider/callback', to: 'omniauth_callbacks#callback'
  get '/auth/failure', to: 'omniauth_callbacks#failure'
  
  # Resource routes
  resources :users do
    member do
      get :connect_oauth
    end
  end
  resources :posts
  
  # API routes
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :posts, only: [:index, :show, :create, :update, :destroy]
    end
  end
  
  # Static pages
  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
