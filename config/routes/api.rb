namespace :api, defaults: { format: :json } do
  namespace :v1 do
    namespace :users do

      resources :auth, only: [] do
        collection do
          post :login, :logout, :code_login, :sign_up
          put :change_password
          get :ping, :send_verification_code
        end
      end

      resources :store_categories
      
      resources :stores, except: [:edit, :new] do
        member do
          post :store_cars
          get :store_car, :store_car_list
        end
        collection do
          get :store_categories
        end
      end
      resources :cars, except: [:edit, :new] do
        collection do
          get :brands
        end
      end

      resources :users do
        collection do
          post :auth_apply
        end
      end
    end
    resources :attachments do
      collection do
        post :upload
      end
    end
  end
end
