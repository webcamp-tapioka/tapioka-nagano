<<<<<<< HEAD
class Public::LikesController < ApplicationController
=======
class Public::LikesController < Public::ApplicationController
>>>>>>> origin/master
  def create
  	like = current_user.likes.create!(product_id: params[:product_id])
  	# redirect_to product_path(like.product_id)
  	@products = Product.find(params[:product_id])
    @products_all = Product.all
  end

  def destroy
  	@products = Product.find(params[:product_id])
    @products_all = Product.all
  	current_user.likes.find_by(product_id: params[:product_id]).destroy!
  	# redirect_to product_path(params[:product_id])
  end
end
