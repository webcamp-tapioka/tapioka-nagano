class Public::LikesController < ApplicationController
  def create
  	like = current_user.likes.create!(product_id: params[:product_id])
  	redirect_to product_path(like.product_id)
  end

  def destroy
  	current_user.likes.find_by(params[:product_id]).destroy!
  	redirect_to product_path(params[:product_id])
  end
end
