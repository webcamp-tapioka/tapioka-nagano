class Admin::GenreProductsController < ApplicationController

  def create
    GenreProduct.create(genre_product_params)
    redirect_to edit_admin_product_path(genre_product_params[:product_id])
  end

  def destroy
    destroy_genre_product = GenreProduct.find(params[:id]).destroy
    redirect_to edit_admin_product_path(destroy_genre_product.product_id)
  end



  private
  def genre_product_params
    params.require(:genre_product).permite(:genre_id :product_id)
  end
  
end
