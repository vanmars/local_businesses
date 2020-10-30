Rails.application.routes.draw do
  resources :restaurants
  resources :shops

  # Custom Endpoints
  get 'restaurants/random', to: 'restaurants#random'
  get 'restaurants/search', to: 'restaurants#search'

  get 'shops/random', to: 'shops#random'
  get 'shops/search', to: 'shops#search'
end
