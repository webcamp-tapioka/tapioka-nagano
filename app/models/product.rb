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
  has_many :likes,dependent: :destroy
  has_many :reviews,dependent: :destroy

  attachment :image


  def self.search(search)
      if search
        Product.where(['title LIKE ?', "%#{search}%"])
      else
        Product.all
      end
  end
  
  enum product_status_id: %i(販売中 販売停止中)
# defaultは1で、"販売停止中"になる



  # defaultは0で、"シングル"になる
  enum single_album_flag: %i( シングル アルバム )

  def liked_by?(current_user)
    likes.where(user_id: current_user).exists?
  end

end
