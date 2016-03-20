namespace :api, defaults: { format: :json } do
  namespace :v1 do
    namespace :users do

      resources :auth, only: [] do
        collection do
          post :login, :logout, :code_login, :sign_up
          get :ping, :send_verification_code
        end
      end

      resources :store_categories
      
      resources :stores, except: [:edit, :new] do
        member do
          post :store_cars
          get :store_car
        end
      end
      resources :cars, except: [:edit, :new] do
      end
    end
    resources :attachments
  end
end
