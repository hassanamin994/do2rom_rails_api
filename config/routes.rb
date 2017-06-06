Rails.application.routes.draw do
  devise_for :users
  root to: 'product#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
  	resources :prices, only: [:index, :create]
  end
  resources :prices, only: [:show, :edit, :update, :destroy]
end
