Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  root 'restaurants#index'
  put '/restaurant/:id/vote', to: 'restaurants#vote', as: 'vote'
  resources :restaurants
end
