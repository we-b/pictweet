Rails.application.routes.draw do
  devise_for :users
  root  'tweets#index'

  resources :tweets, :exept => [:show]
  # get     '/tweets'           => 'tweets#index'
  # post    '/tweets'           => 'tweets#create'
  # get     '/tweets/new'       => 'tweets#new'
  # delete  '/tweets/:id'       => 'tweets#destroy'
  # get     '/tweets/:id/edit'  => 'tweets#edit'
  # patch   '/tweets/:id'       => 'tweets#update'

  resources :users, :only => [:show] do
    member do
      get :likes
    end
  end
  # get     '/users/:id'        => 'users#show'
  resources :likes, :only => [:create, :destroy]
end
