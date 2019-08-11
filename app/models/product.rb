class Product < ApplicationRecord
  has_many :cart_items
  has_many :users, through: :cart_items
  has_many :songs
  has_many :artist_products
  has_many :artists, through: :artist_products
  has_many :genre_products
  has_many :genres, through: :genre_products
  has_many :order_products
  has_many :orders, through: :order_products
  belongs_to :label
end
