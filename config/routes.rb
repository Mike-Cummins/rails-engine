Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'api/v1/items/find_all', to: 'api/v1/items/find_all#index'
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        resources :items, only: [:index], controller: 'merchants/items'
      end
      resources :items
      get '/items/:id/merchant', to: 'items/merchant#show'
    end
  end
end
