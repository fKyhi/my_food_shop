Rails.application.routes.draw do
  devise_for :users
  root to: "shops#index"
  resources :users, only: [:edit, :update, :destroy]
  resources :shops do
    resources :foods, only: [:new, :create, :edit, :update, :destroy]
  end
end
