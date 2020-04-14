Rails.application.routes.draw do

  root "services#index"
  resources :services, only: [:index, :new] do
    collection do
      post "/new", to: "services#create"
    end
  end

  # resources :services, only: [:index, :new, :create]

  devise_for :users
  devise_scope :user do
    get "login", to: "devise/sessions#new"
    get "register", to: "devise/registrations#new"
  end

  namespace :admin do
    root to: "services#index"
    resources :services
    resources :categories
    resources :users, except: [:new, :create]
  end

  namespace :api do
    resources :services, only: [:index, :show]
  end

end
