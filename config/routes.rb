Rails.application.routes.draw do
  root 'home#index'
  
  resources :users
  resources :posts
  
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :posts, only: [:index, :show, :create, :update, :destroy]
    end
  end
  
  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
