class ProductsController < ApplicationController
def top
end

	def index
		@products = Product.all
	end

end
