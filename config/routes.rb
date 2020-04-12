Rails.application.routes.draw do

  root "services#index"
  resources :services, only: [:index, :new, :create]

  devise_for :users
  namespace :admin do
    root to: "services#index"
    resources :services
    resources :categories
    resources :users
  end

  namespace :api do
    resources :services, only: [:index, :show]
  end

end
