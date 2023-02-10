Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'api/v1/items/find_all', to: 'items/find_all#index'
  get '/items/:id/merchant', to: 'items/merchant#show'
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        resources :items, only: [:index], controller: 'merchants/items'
      end
      resources :items
      # namespace :items do    
      #   resources :find_all, only: [:index]
      # end
    end
  end
end
