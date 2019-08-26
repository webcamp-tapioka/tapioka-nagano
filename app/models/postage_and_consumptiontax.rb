class PostageAndConsumptiontax < ApplicationRecord
	validates :postage,presence: true
	validates :consumption_tax, presence: true
end
