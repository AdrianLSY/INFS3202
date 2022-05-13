Rails.application.routes.draw do

  # Landing 
  get '/', to: 'mains#landing', as: 'landing'

  get '/register', to: 'users#new', as: 'register'
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/activate', to: 'users#activate', as: 'activate'
  post '/activate', to: 'users#activated', as: 'activated'
  get '/regerate', to: 'users#regenerate_code', as: 'regenerate_code'

  resources :sessions, only: [:create]
  resources :users, except: [:new]

  resources :courses do
    resources :posts do
      resources :comments
    end
  end

end
