Rails.application.routes.draw do
  devise_for :authors
  resources :articles
  root to: "home#index"
end
