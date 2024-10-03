Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "authenticated/dashboard#index"
  get "dashboard" => "authenticated/dashboard#index"

  # Defines the root path route ("/")
  # root "posts#index"
end
