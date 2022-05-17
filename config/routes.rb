Rails.application.routes.draw do
  get '/', to: 'mains#landing', as: 'landing'

  get '/register', to: 'users#new', as: 'register'
  get '/login', to: 'sessions#new', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/activate', to: 'users#activate', as: 'activate'
  post '/activate', to: 'users#activated', as: 'activated'
  get '/regerate', to: 'users#regenerate_code', as: 'regenerate_code'

  put '/courses/:course_id/posts/:id/award', to: 'posts#award', as: 'course_post_award'
  put '/courses/:course_id/posts/:id/comments/:id/award', to: 'comments#award', as: 'course_post_comment_award'

  resources :sessions, only: [:create]
  resources :users, except: [:new]

  resources :courses do
    resources :posts do
      resources :comments
    end
  end

end
