class ProductsController < ApplicationController

  def show
   	  @products = Product.find(params[:id])
      @review = Review.new
      @reviews = Review.where(product_id: params[:id])
   end
   
	def index
		@products_all = Product.all
  end


	

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @products = Product.search(params[:search])
  end
  
 private
  
  def product_params
    params.require(:products).permit(:image_id, :title, :artist, :stock, :price, :product_status_id)
  end

end