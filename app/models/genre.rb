class Genre < ApplicationRecord
  has_many :genre_products, dependent: :destroy
end
