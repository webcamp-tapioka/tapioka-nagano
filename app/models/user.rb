class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	acts_as_paranoid without_default_scope: false

  has_many :addresses
  has_many :orders
  has_many :order_products, through: :orders
  has_many :cart_items
  has_many :products, through: :cart_items
  has_many :likes,dependent: :destroy
  has_many :reviews,dependent: :destroy


  validates :email,uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :phone_number, presence: true,uniqueness: true

  def total_price
    a = 0
    cart_items.each do |f|
      #Product.find(f.product_id)
      a += f.product_amount * f.product.price
    end
    a = (a * ((PostageAndConsumptiontax.find(1).consumption_tax) * 0.01r + 1)).floor
    return a
  end




 

  
end
