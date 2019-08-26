class Genre < ApplicationRecord
  has_many :artist_products, dependent: :destroy
end
