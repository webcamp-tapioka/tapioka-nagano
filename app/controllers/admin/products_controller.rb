class Admin::ProductsController < ApplicationController
	def show
		@products = Product.find(params[:id])
	end

	def index
		@products = Product.all
	end

	def new
	end

	def edit
		@product = Product.find(params[:id])
	end


	def create
		@product = Product.new(product_params)
	    @product.save
	end

	def destroy
		products = Product.find(params[:id])
	end

	def update
		  @product = Product.find(params[:id])
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
    params.require(:product).permit(:image, :title, :price, :products_status_id, :label_id, :amount )
  end


end