Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get'/products/search' => 'products#search'
  namespace :admin do
  get'/products/search' => 'products#search'

  root to:'admins#show'

  resource :admins,only: %i(edit update)
  resources :artists,only: %i(create edit update destroy index)
  resources :artist_products, only: %i(create destroy)
  resources :genres,only: %i(create edit update destroy index)
  resources :genre_products, only: %i(create destroy)
  resources :labels,only: %i(create edit update destroy index)
  resources :orders,only: %i(index show update)
  resources :products do 
    resources :songs
  end
  resources :users
  resource :postage_and_consumptiontaxs,only: %i(show edit update)
  end

 scope module:  :public do
  get'/users/leave' => 'users#leave'
  get'/users/thank_you' => 'users#thank_you'
  resources :cart_items, only: %i(create index destroy update)
 	resources :addresses,except: %i(new show)
 	resources :order_products,only: %i(create)
 	resources :orders,only: %i(new create index)
 	resources :users,only: %i(index edit show update destroy)
  resources :products,only: %i() do
  resources :cart_items,only: %i(create)
  resource :likes,only: %i(create destroy)
  resource :reviews,only: %i(show create)
  resources :reviews,only: %i(destroy)
end
end

 	resources :products,only:  %i(index show)
 	root 'products#top'
end



