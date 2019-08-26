class Admin::ProductsController < ApplicationController

	def show
		if Product.find(params[:id]).deleted_at
			redirect_to admin_products_path and return
		end
		@products = Product.find(params[:id])
	end

	def index
		@products = Product.where(deleted_at: nil)
	end
	
	def new
		@product = Product.new
		@product.artist_products.build
		@product.genre_products.build
	end

	def edit
		if Product.find(params[:id]).deleted_at
			redirect_to admin_products_path and return
		end
		@product = Product.find(params[:id])
		@artist_product = @product.artist_products.build
		@genre_product = @product.genre_products.build
	end

	def create
		@product = Product.new(product_params)
		if @product.save
	  	  redirect_to admin_products_path, notice: "succsess!"
	  	else
	  		render 'new'
	  	end
	end

	def destroy
		destroy_product = Product.find(params[:id])
		destroy_product.title += "は、削除済みの商品です"
		destroy_product.update(product_status_id: 1)
		destroy_product.destroy
		redirect_to admin_products_path, notice: "succsess!"
	end


	
    
    def search
	    #Viewのformで取得したパラメータをモデルに渡す
	    @products = Product.search(params[:search]).where(deleted_at: nil)
    end

    
	def update
	  @product = Product.find(params[:id])
	if  @product.update(product_params)
	    redirect_to admin_product_path(@product), notice: "succsess!"
	else
		render 'edit'
	end
	end



	private
	
    def product_params                
			params.require(:product).permit(:image, :title, 
			:price, :product_status_id, :label_id, :amount, 
			:artist, artist_products_attributes: [:artist_id ], 
			genre_products_attributes: [:genre_id ])
    end
 
end
