
Rails.application.routes.draw do


  scope "/api" do
    post 'user_token' => 'user_token#create'
      
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :products do
      resources :prices, only: [:index, :create]
      resources :comments, only: [:index, :create]
    end
    resources :prices, only: [:show, :edit, :update, :destroy]
    resources :comments, only: [:show, :edit, :update, :destroy]
    get '/products/search/:seraching_word', to: 'products#search'
    get '/products/searchqr/:seraching_qr', to: 'products#searchqr'
    delete '/users/Blockingusers', to: 'products#Blockedusers'
    post 'prices/:id/confirm' => 'prices#confirm'
    post 'prices/:id/disconfirm' => 'prices#disconfirm'
    resources :users 
    get '/my_info' => 'users#my_inf'
    root to: 'product#index'
    match '*path', :controller => 'api', :action => 'handle_options_request', :via => [:get, :post, :options]
  end

  
end
