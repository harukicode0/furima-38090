Rails.application.routes.draw do
  devise_for :users
  root to: 'goods#index'
  resources :goods do
    resources :matches,only: [:index,:create]
  end
end
