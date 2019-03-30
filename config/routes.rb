Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_scope :user do
    get  'login', to: 'devise/sessions#new'
    #get  'users/new', to: 'devise/registrations#new'
    get  'password/new', to: 'users/passwords#new'
    get  'sign_in', to: 'users/passwords#create'
    get  'edit_password', to: 'users/passwords#edit'
    get  'update_password', to: 'users/passwords#update'
    get  'new_reg', to: 'users/registrations#new'
    delete 'destroy_registration', to: 'users/registrations#destroy'
    get  'users_login', to: 'users/sessions#new'
    post 'users_login_create', to: 'users/sessions#create'
  end
  
  root to: 'splash_screen#new'
  get  '/splash_screen', to: 'splash_screen#new'
  get 'users/new', to: 'users#new'
  post 'users', to: 'users/registrations#create'
  get    '/home_page',   to: 'home_page#new'
  get    '/contact',   to: 'contact#new'
  get    '/contacts_page',   to: 'contacts_page#new'
  get    '/payment_page',   to: 'payment_page#new'
  get    '/orders_page',   to: 'orders_page#new'
  get    '/profile_page',   to: 'profile_page#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/dash',   to: 'dash_board#new'
  
  put '/property/update', to: 'property#update'
  get    '/property', to: 'property#new'
  post   '/property', to: 'property#create'
  match '/property/delete/:id', to: 'property#destroy', :via => :delete, :as => :delete_property
  match '/property/edit/:id', to: 'property#edit', :via => :get, :as => :edit_property
  #match '/property/update/:id', to: 'property#update', :via => :put, :as => :update_property
  #put    '/property', to: 'property#update'
  get    '/view_more', to: 'view_more_property#new'
  delete '/logout',  to: 'sessions#destroy'
  resources:users
  resources:property
  

end
