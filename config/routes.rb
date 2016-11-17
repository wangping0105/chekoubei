class ActionDispatch::Routing::Mapper
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end
end

Rails.application.routes.draw do
  mount Homeland::Engine, at: "/homeland"
  mount RuCaptcha::Engine => "/rucaptcha"
  draw :api

  root "home#index"
  resources :sessions
  resources :home, only:[ :index] do
    get :app ,on: :collection
  end
  resources :brands
  resources :cars
  resources :tags
  resources :stores do
    collection do
      get :get_address_options, :get_store_brand_options
    end
    namespace :stores do
      resources :cars
    end
  end

  resources :auth_applies, only:[ :index] do
    collection do
      get :treated
    end
  end

  resources :users do
    member do
      post :user_tag
      delete :destroy_tag
      put :pass_auth, :dyne_auth
    end
  end
end
