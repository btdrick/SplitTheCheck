Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    sessions: 'users/sessions'
  }
  devise_scope :users do
    get 'sign_up', to: 'users/registrations#new'
    get 'sign_in', to: 'users/sessions#new'
    delete 'sign_out', to: 'users/sessions#destroy'
  end
  resources :users

  root 'restaurants#index'
  #put '/restaurant/:id/vote', to: 'restaurants#vote', as: 'vote'

  resources :restaurants

  resources :votes, only: [:create]
end
