Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "customised_registrations" }
  root to: "welcome#index"

  namespace :hr do
    resources :positions
    get '/suggest_interviews/:user_id', to: "matchings#suggest"
  end

  namespace :candidate do
    resources :positions, only: [:index, :show]
    resources :user_position_requests, only: [:create, :destroy]
  end
end
