class AdminsController < ApplicationController
　　　　
　　　def show
	　@products = Product.find(params[:id])
   	end


	def index
		@products = Product.all

	end

	def edit
		@products = Product.find(params[:id])
	end

	def new
		@products = Product.new
	end



	def create
		@products = Product.new(products_params)
	    products.save
	    redirect_to products_params

	end

	def destroy
		products = Products.find(params[:id])
	end

	def update
		  @products = Products.find(params[:id])
		if
		  @products.update(products_params)
		  redirect_to products_path(@products),notice: "Products was successfully updated"
        else
          flash[:notice] = "error"
          render :edit
        end
	end

 private
  
  def product_params
    params.require(:products).permit(:image_id, :title, :artist, :stock, :price, :status )
  end


end

end
