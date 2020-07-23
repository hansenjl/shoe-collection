Rails.application.routes.draw do
  root 'sessions#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/auth/google_oath2/callback', to: 'sessions#omniauth'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'





  get '/shoes/expensive', to: 'shoes#expensive', as: 'expensive_shoe'

  resources :shoes
  resources :brands, only: [:new, :create, :index, :show] do
    resources :shoes, only: [:new, :create, :index]
  end

end
