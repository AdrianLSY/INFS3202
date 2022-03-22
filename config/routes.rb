Rails.application.routes.draw do
  get '/', to: 'mains#landing'
  resources :users
end
