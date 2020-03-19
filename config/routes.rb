Rails.application.routes.draw do

  root "services#search"

  resources :services, only: [:index] do
    collection do
      get 'search'
    end
  end

end
