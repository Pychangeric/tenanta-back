Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations], path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  as :admin do
    get 'admins/sign_up', to: 'admins/registrations#new', as: 'new_admin_registration'
    post 'admins', to: 'admins/registrations#create', as: 'admin_registration'
  end

  namespace :admin do
    get 'dashboard', to: 'dashboard#index'  
  end

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

  resources :residences, only: [:index, :show]
  resources :payments, only: [:new, :create]
  resources :users, only: [:show, :edit, :update, :destroy]

  root to: 'residences#index'
end
