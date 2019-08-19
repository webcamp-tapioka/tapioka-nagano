class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

# defaultは1、"銀行振込"になる
  enum payment_method: %i(クレジットカード 銀行振込 代引き)
#  defaultは1、"受付中"になる
  enum order_status_id: %i(準備中 受付中 送付済み)

end
