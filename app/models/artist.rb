class Artist < ApplicationRecord
	has_many :artist_products, dependent: :destroy
	has_many :products, through: :artist_products
end
