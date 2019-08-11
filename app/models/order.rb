class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products


  enum :payment_method_flag %i( クレジットカード　銀行振込　代引き )
  enum :order_status_flag %i( 準備中　受付中　送付済み)
  
end
