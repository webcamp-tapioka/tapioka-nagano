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
end
