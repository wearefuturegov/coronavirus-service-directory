Rails.application.routes.draw do

  namespace :admin do
      resources :services
      root to: "services#index"
  end

  root "services#index"

  # public routes
  resources :services, only: [:index]

  namespace :api do
    resources :services, only: [:index, :show]
  end

end
