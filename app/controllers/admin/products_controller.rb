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

	def new
    	@product = Product.new
    	@product.artist_products.build
    end

	def create
		@product = Product.new(product_params)
	  @product.save
	  redirect_to admin_products_path,notice: "succsess!"
	end

	def destroy
		products = Product.find(params[:id])
	end

	def self.search(search)
      if search
        Product.where(['title LIKE ?', "%#{search}%"])
      else
        Product.all
      end
    end
    
    def search
    #Viewのformで取得したパラメータをモデルに渡す
    @products = Product.search(params[:search])
    end
    

	def update
	@products = Product.find(params[:id])
	@products.update(product_params)
	redirect_to admin_products_path,notice: "succsess!"
	end
	



	private
	
    def product_params                
			params.require(:product).permit(:image, :title, :price, :product_status_id, :label_id, 
			:amount, :single_album_flag, artist_products_attributes: [:artist_id])
    end
 
end

