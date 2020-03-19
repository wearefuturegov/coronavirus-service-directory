Rails.application.routes.draw do

  root "services#search"

  # public routes
  resources :services, only: [:index] do
    collection do
      get 'search'
    end
  end

  # admin routes
  namespace :admin do
    resources :services
  end

end
