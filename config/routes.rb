Rails.application.routes.draw do
  get 'user_sessions/new'

  get 'user_sessions/create'

  get 'user_sessions/destroy'

  root  'tweets#index'

  resources :tweets, :except => [:show]
  # get     '/tweets'           => 'tweets#index'
  # post    '/tweets'           => 'tweets#create'
  # get     '/tweets/new'       => 'tweets#new'
  # delete  '/tweets/:id'       => 'tweets#destroy'
  # get     '/tweets/:id/edit'  => 'tweets#edit'
  # patch   '/tweets/:id'       => 'tweets#update'

  resources :users, except: :index
  # get     '/users/:id'      => 'users#show'
  # post    '/users'          => 'users#create'
  # get     '/users/new'      => 'users#new'
  # delete  '/users/:id'      => 'users#destroy'
  # get     '/users/:id/edit' => 'users#edit'
  # patch   '/users/:id'      => 'users#update'

  resources :user_sessions, except: :index
  # get     '/user_sessions/:id'      => 'user_sessions#show'
  # post    '/user_sessions'          => 'user_sessions#create'
  # get     '/user_sessions/new'      => 'user_sessions#new'
  # delete  '/user_sessions/:id'      => 'user_sessions#destroy'
  # get     '/user_sessions/:id/edit' => 'user_sessions#edit'
  # patch   '/user_sessions/:id'      => 'user_sessions#update'

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
