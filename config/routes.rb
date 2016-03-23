class ActionDispatch::Routing::Mapper
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end
end

Rails.application.routes.draw do


  mount RuCaptcha::Engine => "/rucaptcha"
  draw :api

  root "home#index"
  resources :sessions
  resources :home
  resources :cars
  resources :tags
  resources :stores
  resources :auth_applies, only:[ :index] do
    collection do
      get :treated
    end
  end
  resources :users do
    member do
      post :user_tag
    end
  end
end
