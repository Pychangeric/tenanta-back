Rails.application.routes.draw do
  namespace :leaders do
    get 'dashboard/index'
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
    get 'profile', to: 'profiles#show'
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
