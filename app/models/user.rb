class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	acts_as_paranoid

  has_many :addresses
  has_many :orders
  has_many :order_products, through: :orders
  has_many :cart_items
  has_many :products, through: :cart_items


  def total_price
    a = 0
    cart_items.each do |f|
      a += f.product_amount * f.product.price
    end
    a = (a * ((PostageAndConsumptiontax.find(1).consumption_tax) * 0.01r + 1)).floor
    return a
  end




  has_many :likes,dependent: :destroy
  has_many :reviews,dependent: :destroy

  
end
