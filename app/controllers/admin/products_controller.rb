<<<<<<< HEAD
class Admin::ProductsController < ApplicationController
=======
class Admin::ProductsController < Admin::ApplicationController
>>>>>>> origin/master

	def show
		@products = Product.find(params[:id])
	end

	def index
		@products = Product.all
	end
	
	def new
		@product = Product.new
		@product.artist_products.build
		@product.genre_products.build
	end

	def edit
		@product = Product.find(params[:id])
		@artist_product = @product.artist_products.build
		@genre_product = @product.genre_products.build
	end


	def create
		@product = Product.new(product_params)
<<<<<<< HEAD
		@product.save
	  	redirect_to admin_products_path, notice: "succsess!"
=======
		if @product.save
	  	  redirect_to admin_products_path, notice: "succsess!"
	  	else
	  		render 'new'
	  	end
>>>>>>> origin/master
	end

	def destroy
		Product.find(params[:id]).destroy
		redirect_to admin_products_path, notice: "succsess!"
	end


	
    
    def search
	    #Viewのformで取得したパラメータをモデルに渡す
	    @products = Product.search(params[:search])
    end

    
	def update
	  @product = Product.find(params[:id])
<<<<<<< HEAD
		@product.update(product_params)
	  redirect_to admin_product_path(@product), notice: "succsess!"
=======
	if  @product.update(product_params)
	    redirect_to admin_product_path(@product), notice: "succsess!"
	else
		render 'edit'
	end
>>>>>>> origin/master
	end



	private
	
    def product_params                
			params.require(:product).permit(:image, :title, 
			:price, :product_status_id, :label_id, :amount, 
			:artist, artist_products_attributes: [:artist_id ], 
			genre_products_attributes: [:genre_id ])
    end
 
end
