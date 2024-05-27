Rails.application.routes.draw do

    # Handle OPTIONS requests for Devise registrations and sessions
    match 'users/registrations' => 'application#handle_options_request', via: [:options]
    match 'users/sessions' => 'application#handle_options_request', via: [:options]
    match '*path', to: 'application#handle_options_request', via: :options



  namespace :leaders do
    get 'residences/index'
    get 'residences/show'
    get 'residences/new'
    get 'residences/edit'
    get 'dashboard/index'
  end

  namespace :leaders do
    resources :residences, only: [:new, :create]
  end
   

  # Devise routes for leaders
  devise_for :leaders, controllers: { 
    registrations: 'leaders/registrations',
    sessions: 'leaders/sessions',
  }

  namespace :leaders do
    get 'dashboard', to: 'dashboard#index'
  end
  namespace :leaders do
    resource :profile, only: [:show, :edit, :update]
  end
  namespace :leaders do
    resources :types
  end

  # Devise routes for users
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
