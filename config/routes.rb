Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  root to: 'pages#home'
  post 'toggle_favorites', to: "pages#toggle_favorites"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :nfts, except: :index do
    resources :comments, only: [:create, :destroy]
    # member do
      # get 'discover', to: "nfts#discover"
      # get 'nfts/:id/discover', to: "nfts#discover"
    # end
    member do
      post 'toggle_favorite', to: "nfts#toggle_favorite"
    end

    collection do
      get 'discover', to: "nfts#discover"
      post 'new_nft', to: "nfts#new_nft"
      get 'liked_nfts', to: "nfts#liked_nfts"
    end
  end
  # resources :comments, only: :create
  # get 'users/:id', to: "comments#create"
  # resources :users, only: :show

  resources :chatrooms, only: [:show, :create] do
    resources :messages, only: :create
  end
end
