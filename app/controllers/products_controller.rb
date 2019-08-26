class ProductsController < ApplicationController

  def top
  end

  def show 
    if Product.find(params[:id]).deleted_at
      redirect_to products_path and return
    end
     @products = Product.where(deleted_at: nil).find(params[:id])
      @review = Review.new
      @reviews = Review.where(product_id: params[:id]).order(created_at: "DESC")
      if current_user.present?
      @new_cart_item = current_user.cart_items.new
      @new_cart_item.product_id = @products.id
      end
   end

  def index
    @products_all = Product.where(deleted_at: nil).page(params[:page]).per(8)

  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @products = Product.search(params[:search]).where(deleted_at: nil).page(params[:page]).per(8)
   
  end


 private

  def product_params
    params.require(:products).permit(:image, :title, :artist, :stock, :price, :product_status_id)
  end

end