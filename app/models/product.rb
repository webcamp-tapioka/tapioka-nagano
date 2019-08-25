class Product < ApplicationRecord
  has_many :cart_items
  has_many :users, through: :cart_items
  has_many :songs
  has_many :artist_products
  accepts_nested_attributes_for :artist_products
  has_many :artists, through: :artist_products
  has_many :genre_products
  has_many :genres, through: :genre_products
  accepts_nested_attributes_for :genre_products 
  has_many :order_products
  has_many :orders, through: :order_products
  belongs_to :label
  has_many :likes,dependent: :destroy
  has_many :reviews,dependent: :destroy

  attachment :image
  acts_as_paranoid without_default_scope: false

  validates :title,presence: true
  validates :price,presence: true,numericality: true
  validates :amount,presence: true,numericality: true


  def self.search(search)
      if search
        Product.where(['title LIKE ?', "%#{search}%"])
      else
        Product.all
      end
  end

  # defaultは1で、"販売停止中"になる
  enum product_status_id: %i( 販売中 販売停止中 )

  # defaultは0で、"シングル"になる
  enum single_album_flag: %i( シングル アルバム )


  def liked_by?(current_user)
    likes.where(user_id: current_user.id).exists?
  end


  def tax_include_price
    (self.price * ((PostageAndConsumptiontax.find(1).consumption_tax * 0.01r) + 1)).floor
  end
end
