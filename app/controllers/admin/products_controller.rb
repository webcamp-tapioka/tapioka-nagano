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
	end


	def create
		@product = Product.new(product_params)
	    @product.save
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
		  @product = Product.find(params[:id])
		if

		  @product.update(product_params)
		  redirect_to products_path,notice: "Products was successfully updated"

		
        else
          flash[:notice] = "error"
          render :edit
    	end
    end
	
    private
  

    def product_params                

      params.require(:product).permit(:image, :title,
       :price, :products_status_id, :label_id, :amount,
        :artist, artist_products_attributes: [:artist_id ], 
         genre_products_attributes: [:genre_id ])
   
 

      end
 end


