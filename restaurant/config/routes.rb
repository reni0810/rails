Rails.application.routes.draw do
  devise_for :users , skip: [:sessions, :registrations, :password]
  devise_scope :user do
    root to: "devise/sessions#new"
    get '/login',      to: 'devise/sessions#new',         as: :new_user_session
    post '/login',     to: 'devise/sessions#create',      as: :user_session
    delete '/logout',  to: 'devise/sessions#destroy',     as: :destroy_user_session

    get '/register',   to: 'devise/registrations#new',    as: :new_user_registration
    post '/register',  to: 'devise/registrations#create', as: :user_registration
    get '/edit',       to: 'devise/registrations#edit',   as: :edit_user_registration
    patch '/register', to: 'devise/registrations#update', as: :update_user_registration
    delete'/register', to: 'devise/registrations#destroy',as: :delete_user_registration

    get '/forgot-password',  to: 'devise/passwords#new',    as: :new_user_password
    post '/forgot-password', to: 'devise/passwords#create', as: :user_password
    get '/edit-password',    to: 'devise/passwords#edit',   as: :edit_user_password
    patch '/forgot-password',to: 'devise/passwords#update', as: :update_user_password

  end
  resources :timings
  resources :restaurants
  resources :unavailabities
  resources :users
  resources :facilities
  resources :recipes
  resources :cuisines
  resources :user_restaurants
  default_url_options host: "localhost:3000"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
