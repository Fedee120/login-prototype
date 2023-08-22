Rails.application.routes.draw do
  resources :users, only: [:create] # for user registration
  post '/login', to: 'sessions#create' # for login
  delete '/logout', to: 'sessions#destroy' # for logout
  get 'index', to: 'users#index' # for user index

end
