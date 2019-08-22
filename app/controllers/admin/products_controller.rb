class Admin::ProductsController < ApplicationController


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

		@product.artist_products.build
		@product.genre_products.build

	end

	def new
    @product = Product.new
    @product.artist_products.build
  end

	def create
		@product = Product.new(product_params)
		@product.save
	  redirect_to admin_products_path, notice: "succsess!"
	end

	def destroy
		Product.find(params[:id]).destroy
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

	  @product = Product.find(params[:id])
		@product.update(product_params)
	  redirect_to admin_products_path,notice: "succsess!"
	end

	


	private
	
    def product_params                

      params.require(:product).permit(:image, :title,
       :price, :products_status_id, :label_id, :amount,
        :artist, artist_products_attributes: [:artist_id ], 
         genre_products_attributes: [:genre_id ])
   
 

      end
 end


