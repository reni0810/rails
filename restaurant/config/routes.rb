Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  resources :timings
  resources :restaurants
  resources :unavailabities
  resources :users
  resources :facilities
  resources :recipes
  resources :cuisines
  #root 'restaurants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
