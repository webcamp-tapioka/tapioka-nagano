class Song < ApplicationRecord
  belongs_to :product

  validates :song, presence: true



end
