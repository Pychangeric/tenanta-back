Rails.application.routes.draw do
  # Admin routes
  namespace :admins do
    resource :profile, only: [:show]
  end

  devise_for :admins, controllers: { registrations: 'admins/registrations' }, skip: [:registrations], path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  # Remove the following duplicated route definitions
  as :admin do
    get 'admins/sign_up', to: 'admins/registrations#new', as: 'new_admin_registration'
    post 'admins', to: 'admins/registrations#create', as: 'admin_registration'
  end

  namespace :admin do
    get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  end

  # User routes
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks',
    confirmations: 'users/confirmations',
  }

  devise_scope :user do
    get 'logout', to: 'devise/sessions#destroy'
  end

  # Resources routes
  resources :residences, only: [:index, :show]
  resources :payments, only: [:new, :create]
  resources :users, only: [:show, :edit, :update, :destroy]

  root to: 'residences#index'
end
