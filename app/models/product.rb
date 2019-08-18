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

  attachment :image

# defaultは1で、"販売停止中"になる

  enum product_status_flag: %i( 販売中 販売停止中 )

  # defaultは0で、"シングル"になる
  enum single_album_flag: %i( シングル アルバム )


end
