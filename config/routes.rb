Rails.application.routes.draw do
 root to: 'homes#top'
 devise_for :users
 get "/home/about" => "homes#about", as: "about"
 get '/search', to: 'searches#search'
 #get "search" => "searches#search"

 resources :users
 resources :books do
  resource :favorites, only: [:create, :destroy]
 resources :book_comments, only: [:create, :destroy]
 end

 resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end

