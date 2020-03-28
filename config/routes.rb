Rails.application.routes.draw do

  root "services#search"

  # public routes
  resources :services, only: [:index] do
    collection do
      get 'search'
    end
  end

  namespace :api do
    resources :services, only: [:index, :show]
  end

end
