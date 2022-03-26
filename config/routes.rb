Rails.application.routes.draw do
  root :to => redirect('/restaurants')
  put '/restaurant/:id/vote', to: 'restaurants#vote', as: 'vote'
  resources :restaurants
end
