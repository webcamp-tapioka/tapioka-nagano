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
 
 scope module:  :public do

 	resources :address,only:  %i(new create destroy)
 	# resources :products,only: %i() do
  resources :cart_items,only:  %i(index create destroy update)
#end

  get'/users/leave' => 'users#leave'
  get'/users/thank_you' => 'users#thank_you'
 	resources :addresses,except: %i(new show)
  
 	resources :cart_items,only:  %i(index destroy update)
 	resources :order_products,only: %i(create)
 	resources :orders,only:  %i(new create index)
 	resources :users,only:  %i(edit show update destroy)
  resources :products,only: %i() do
  resources :cart_items,only:  %i(create)
  resources :likes,only: %i(create destroy)
end
end

 	resources :products,only:  %i(index show)
 	get'/products/search' => 'products#search'
 	root 'products#top'
end



