Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  root to: 'product#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
  	resources :prices, only: [:index, :create]
  end
  resources :prices, only: [:show, :edit, :update, :destroy]
  resources :users
end
