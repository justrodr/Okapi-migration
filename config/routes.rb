Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root to: 'dash_board#splash'
  get    '/dash',   to: 'dash_board#new'
  resources:properties
end
