Rails.application.routes.draw do
  root 'top#index'
  resources :labels
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resources :dangerous_spots
  resources :users, only: [:show] 
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end
  resources :favorites, only: [:index, :create, :destroy]
end
