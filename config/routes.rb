Rails.application.routes.draw do
  devise_for :users
  root to: "welcome#index"

  namespace :hr do
    resources :positions
  end

  namespace :candidate do
    resources :positions, only: [:index]
  end
end
