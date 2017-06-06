Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  root to: 'product#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
  	resources :prices, only: [:index, :create]
  end
  resources :prices, only: [:show, :edit, :update, :destroy]
  post 'prices/:id/confirm' => 'prices#confirm'
  post 'prices/:id/disconfirm' => 'prices#disconfirm'
  get '/products/search/:seraching_word', to: 'products#search'
  resources :users  #knock added routes
end
