namespace :api, defaults: { format: :json } do
  namespace :v1 do
    namespace :users do
      resources :auth, only: [] do
        collection do
          post :login, :logout, :code_login, :sign_up
          get :ping, :send_verification_code
        end
      end
    end
  end
end
