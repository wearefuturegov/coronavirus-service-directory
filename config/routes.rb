Rails.application.routes.draw do

  root "services#search"

  # public routes
  resources :services, only: [:index] do
    collection do
      get 'search'
    end
  end

  namespace :api do
    resources :services, only: [:index]
  end

  # # admin routes
  # namespace :admin do
  #   # root "services#search"
  #   resources :services
  # end

end
