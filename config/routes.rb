Rails.application.routes.draw do
  devise_for :users, controllers: {passwords: 'users/passwords', sessions: 'users/sessions', registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'dash_board#splash'
  get    '/dash',   to: 'dash_board#new'
  #get    '/contacts_page', to: 'dash_board#contacts'
  get    '/payment_page', to: 'dash_board#payment'
  get    '/orders_page', to: 'order#new'
  get    '/profile', to: 'users#edit'
  get    '/admin', to: 'dash_board#admin'
  match   'properties/add/:id', to: 'properties#add', :via => :get, :as => :add_order
  match   'order/checkout/', to: 'order#checkout', :via => :post, :as => :checkout
  resources:properties

end
