class ProductsController < ApplicationController

  def show
   	  @products = Product.find(params[:id])
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
    params.require(:products).permit(:image_id, :title, :artist, :stock, :price, :product_status_id)
  end

end