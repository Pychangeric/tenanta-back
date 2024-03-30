Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'

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
