Rails.application.routes.draw do
  devise_for :users, controllers: {passwords: 'users/passwords', sessions: 'users/sessions', registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'dash_board#splash'
  get    '/dash',   to: 'dash_board#new'
  get    '/contacts_page', to: 'dash_board#contacts'
  get    '/payment_page', to: 'dash_board#payment'
  get    '/orders_page', to: 'dash_board#orders'
  get    '/profile', to: 'users#edit'
  get    '/admin', to: 'dash_board#admin'
  resources:properties

end
