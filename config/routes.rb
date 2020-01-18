Rails.application.routes.draw do
  devise_for :users
  root to: "positions#index"
  resources :positions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
