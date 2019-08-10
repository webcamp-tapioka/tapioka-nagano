class GenreProduct < ApplicationRecord
  belongs_to :genr
  belongs_to :product
end
