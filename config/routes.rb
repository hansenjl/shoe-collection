Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #index

  get '/shoes', to: 'shoes#index'
  get '/shoes/expensive', to: 'shoes#expensive', as: 'expensive_shoe'
  get '/shoes/:id', to: 'shoes#show', as: 'shoe'

   #resources :shoes, only: [:index, :show]


  #show


end
