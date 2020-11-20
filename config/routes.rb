Rails.application.routes.draw do
  devise_for :authors
  resources :articles
  resources :categories
  root to: "home#index"
end
