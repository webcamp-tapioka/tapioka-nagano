class ProductsController < ApplicationController

   def show
   	  @products = Product.find(params[:id])
   end
   
	def index
		@products = Product.all
    @cart_item = CartItem.new

	end

	
 private
  
  def product_params
    params.require(:products).permit(:image_id, :title, :artist, :stock, :price, :status )
  end


end

