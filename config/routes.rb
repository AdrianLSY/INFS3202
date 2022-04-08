Rails.application.routes.draw do

  # Landing 
  get '/', to: 'mains#landing', as: 'landing'

  get '/register', to: 'users#new', as: 'register'
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions, only: [:create]
  resources :users, except: [:new]

end
