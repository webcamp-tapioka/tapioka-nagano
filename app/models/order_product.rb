class OrderProduct < ApplicationRecord
  belongs_to :order, inverse_of: :order_products
  belongs_to :product
end

