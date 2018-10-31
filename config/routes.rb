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
    put    '/account',  to: 'devise/registrations#update'
  delete '/account',  to: 'devise/registrations#destroy'
  post   '/account',  to: 'devise/registrations#create'
  get    '/register', to: 'devise/registrations#new',    as: :new_user_registration
  get    '/account/:id',  to: 'devise/registrations#edit',   as: :edit_user_registration
  patch  '/account',  to: 'devise/registrations#update', as: :user_registration
  get    '/account/cancel', to: 'devise/registrations#cancel', as: :cancel_user_registration# passwords




    #get "user/sign_up", to: "users/registrations#new", as: :new_user_registration
    #post "user/sign_up", to: "users/registrations#create", as: :user_registration
    #get 'user/edit/:id' ,to: 'users/registrations#edit', as: :edit_user_registration
    #put 'user/update', to: 'users/registrations#update', as: :user_registrations
    
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
