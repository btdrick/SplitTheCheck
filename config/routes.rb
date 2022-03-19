Rails.application.routes.draw do
  root :to => redirect('/restaurants')
  resources :restaurants
end
