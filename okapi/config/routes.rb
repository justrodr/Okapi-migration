Rails.application.routes.draw do
  get 'property/new'

  root 'splash_screen#new'
  get 'users/new' => 'users#new'
  post 'users' => 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/dash',   to: 'dash_board#new'
  delete '/logout',  to: 'sessions#destroy'
  resources:users
  resources:session
  

end
