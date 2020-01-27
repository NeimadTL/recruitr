Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "customised_registrations" }
  root to: "welcome#index"

  namespace :hr do
    resources :positions
  end

  namespace :candidate do
    resources :positions, only: [:index, :show]
    resources :user_position_requests, only: [:create, :destroy]
  end
end
