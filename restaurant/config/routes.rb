Rails.application.routes.draw do
  resources :timings
  resources :restaurants
  resources :unavailabities
  resources :users
  resources :facilities
  resources :recipes
  resources :cuisines
  root 'restaurants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
