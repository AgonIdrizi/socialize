Rails.application.routes.draw do
  get 'likes/index'
  get 'friendships/new'
  get 'friendships/create'
  get 'friendships/destroy'
  get 'comments/new'
  get 'comments/create'
  root to: 'static_pages#home'
  devise_for :users
  resources :users, only: [:index,:show]

  resources :posts do
  	resources :comments
    resources :likes, only: [:index,:create,:destroy]
  end

  resources :comments do
  	resources :comments
  end

  resources :friendships
  resources :requests , only: [:index,:new,:create,:destroy]
end
