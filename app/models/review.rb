class Review < ApplicationRecord
	belongs_to :user
	belongs_to :product
<<<<<<< HEAD
=======

	validates :review,presence: true
>>>>>>> origin/master
end
