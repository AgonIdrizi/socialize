Rails.application.routes.draw do
  
  get 'about', to: 'static_pages#about'
  get 'likes/index'
  get 'friendships/new'
  get 'friendships/create'
  get 'friendships/destroy'
  get 'comments/new'
  get 'comments/create'
  root to: 'posts#index'

  devise_for :users,:skip => [:registrations], controllers: { omniauth_callbacks: 'auth/callbacks'}
  
  devise_scope :user do
    get "user/sign_up", to: "users/registrations#new", as: :new_user_registration
    post "user/sign_up", to: "users/registrations#create", as: :user_registrations
    get 'user/edit' ,to: 'users/registrations#edit', as: :edit_user_registration
    put 'user/edit' ,to: 'users/registrations#update', as:  :user_registration
  end

  resources :users, only: [:index,:show,:edit,:update]

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
