Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registration: 'users/registration' }
  devise_scope :user do
    get  'login', to: 'devise/sessions#new'
    get  'users/new', to: 'devise/registrations#new'
    get  'password/new', to: 'users/passwords#new'
    get  'sign_in', to: 'users/passwords#create'
    get  'edit_password', to: 'users/passwords#edit'
    get  'update_password', to: 'users/passwords#update'
    get  'new_reg', to: 'users/registrations#new'
    post 'sign_up', to: 'users/registrations#create'
    delete 'destroy_registration', to: 'users/registrations#destroy'
    get  'users_login', to: 'users/sessions#new'
    post 'users_login_create', to: 'users/sessions#create'
  end
  
  root to: 'splash_screen#new'
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
  
  get    '/property', to: 'property#new'
  post   '/property', to: 'property#create'
  get    '/view_more', to: 'view_more_property#new'
  get    '/edit_property', to: 'edit_property#new'
  delete '/logout',  to: 'sessions#destroy'
  resources:users
  #resources:session
  

end
