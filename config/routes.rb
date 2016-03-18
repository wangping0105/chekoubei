class ActionDispatch::Routing::Mapper
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end
end

Rails.application.routes.draw do
  mount RuCaptcha::Engine => "/rucaptcha"
  draw :api

  root "sessions#index"
  resources :sessions
  resources :home
end
