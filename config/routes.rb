Rails.application.routes.draw do
  root  'tweets#index'

  resources :tweets, :except => [:show]
  # get     '/tweets'           => 'tweets#index'
  # post    '/tweets'           => 'tweets#create'
  # get     '/tweets/new'       => 'tweets#new'
  # delete  '/tweets/:id'       => 'tweets#destroy'
  # get     '/tweets/:id/edit'  => 'tweets#edit'
  # patch   '/tweets/:id'       => 'tweets#update'

  resources :users, :only => [:show]
  # get     '/users/:id'        => 'users#show'
end
