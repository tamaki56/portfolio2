Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :photos do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :users do
    resource :follow
    resources :followings
    resources :followers
    get :favorites, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
