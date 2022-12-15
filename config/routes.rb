Rails.application.routes.draw do
  resources :labels
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resources :dangerous_spots
  resources :users, only: [:show]
  root 'top#index'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  resources :favorites, only: [:index, :create, :destroy]
end
