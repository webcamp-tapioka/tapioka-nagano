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
  has_many :likes,dependent: :destroy

  def liked_by?(current_user)
    likes.where(user_id: current_user).exists?
  end
end
