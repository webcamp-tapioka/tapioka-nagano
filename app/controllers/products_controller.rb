class ProductsController < ApplicationController

  def top
  end

  def show
   	  @products = Product.find(params[:id])
      @review = Review.new
      @reviews = Review.where(product_id: params[:id])
      @new_cart_item = current_user.cart_items.new
      @new_cart_item.product_id = @products.id
   end
   
	def index
		@products = Product.all
  end


	

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @products = Product.search(params[:search])
  end
  
 private
  
  def product_params
    params.require(:products).permit(:image, :title, :artist, :stock, :price, :product_status_id)
  end

end