Rails.application.routes.draw do

  resources :users, only: [:index, :new, :create]
  get '/user', to: 'users#show'
  post '/user', to: 'users#show'
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :notebooks do
    resources :notes
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
