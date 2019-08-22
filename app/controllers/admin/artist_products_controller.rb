class Admin::ArtistProductsController < ApplicationController

  def create
    ArtistProduct.create(artist_product_params)
    redirect_to edit_admin_product_path(artist_product_params[:product_id])
  end

  def destroy
    destroy_artist_product = ArtistProduct.find(params[:id]).destroy
    redirect_to edit_admin_product_path(destroy_artist_product.product_id)
  end



  private

  def artist_product_params
    params.require(:artist_product).permit(:artist_id, :product_id)
  end

end
