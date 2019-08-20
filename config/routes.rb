Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users
  devise_for :admins


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do

  root to:'admins#show'

  resource :admins,only: %i(edit update)
  resources :artists,only: %i(create edit update destroy index)
  resources :genres,only: %i(create edit update destroy index)
  resources :labels,only: %i(create edit update destroy index)
  # resources :songs,only: %i(new create update destroy)
  resources :songs
  resources :orders,only: %i(index show update)
  resources :products
  resources :users

  end
 
  get'/products/search' => 'products#search'
 
 scope module:  :public do
  get'/users/leave' => 'users#leave'
  get'/users/thank_you' => 'users#thank_you'
 	resources :address,only: %i(new create destroy)
  resources :cart_items,only: %i(index  destroy update)
 	resources :addresses,except: %i(new show)
 	resources :order_products,only: %i(create)
 	resources :orders,only: %i(new create index)
 	resources :users,only: %i(edit show update destroy)
  resources :products,only: %i() do
  resources :cart_items,only: %i(create)
  resource :likes,only: %i(create destroy)
  resource :reviews,only: %i(create)
  resources :reviews,only: %i(destroy)
end
end

 	resources :products,only:  %i(index show)
 	get'/products/search' => 'products#search'
 	root 'products#top'
end



