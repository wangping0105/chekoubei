namespace :api, defaults: { format: :json } do
  namespace :v1 do
    resources :auth, only: [] do
      collection do
        post :login, :logout
        get :ping, :send_verification_code
      end
    end
  end
end
