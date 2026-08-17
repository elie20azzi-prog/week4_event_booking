Rails.application.routes.draw do
  get "home/index"

  resource :session
  resources :passwords, param: :token
  resource :registration, only: %i[new create]

  resources :events do
    resources :orders, only: %i[create]
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
end