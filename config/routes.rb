Rails.application.routes.draw do
  get "home/index"

  resource :session

  resources :passwords, param: :token

  resource :registration, only: %i[new create]

  resources :events do
    resources :orders, only: %i[create]
  end

  namespace :api do
    namespace :v1 do
      resources :events, only: %i[index show]
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
end
