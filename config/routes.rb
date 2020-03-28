Rails.application.routes.draw do

  namespace :admin do
      resources :categories
      resources :services

      root to: "categories#index"
    end
  root "services#index"

  # public routes
  resources :services, only: [:index]

  namespace :api do
    resources :services, only: [:index, :show]
  end

end
