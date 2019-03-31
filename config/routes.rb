Rails.application.routes.draw do
  devise_for :users, controllers: {passwords: 'users/passwords', sessions: 'users/sessions', registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'dash_board#splash'
  get    '/dash',   to: 'dash_board#new'
  resources:properties

end
