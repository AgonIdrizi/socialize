Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/create'
  root to: 'static_pages#home'
  devise_for :users
  resources :users, only: [:index,:show]

  resources :posts do
  	resources :comments
  end

  resources :comments do
  	resources :comments
  end
end
