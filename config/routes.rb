Rails.application.routes.draw do
  get 'residences/index'
  root to: 'residences#index'

  resources :residences, only: [:index, :show]


  resources :payments, only: [:new, :create]


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

  resources :users, only: [:show, :edit, :update, :destroy]



end
