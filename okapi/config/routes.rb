Rails.application.routes.draw do
  root 'splash_screen#new'
  get  '/splash_screen', to: 'splash_screen#new'
  get 'users/new', to: 'users#new'
  post 'users', to: 'users#create'
  get    '/home_page',   to: 'home_page#new'
  get    '/contact',   to: 'contact#new'
  get    '/contacts_page',   to: 'contacts_page#new'
  get    '/payment_page',   to: 'payment_page#new'
  get    '/orders_page',   to: 'orders_page#new'
  get    '/profile_page',   to: 'profile_page#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/dash',   to: 'dash_board#new'
  delete '/logout',  to: 'sessions#destroy'
  resources:users
  resources:session
  

end
