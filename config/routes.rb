Rails.application.routes.draw do
  devise_for :users
  root to: "shops#index"
  resources :shops do
    resources :foods, only: [:new, :create]
  end
end
