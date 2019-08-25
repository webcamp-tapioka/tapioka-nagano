class Public::ReviewsController < ApplicationController

	def create
		@products = Product.find(params[:product_id])
		@reviews = Review.where(product_id: params[:id])
		@new_cart_item = current_user.cart_items.new
        @new_cart_item.product_id = @products.id
		@review = current_user.reviews.new(reviews_params)
		@review.product_id = params[:product_id].to_i
		if @review.save
		  redirect_to product_path(params[:product_id])
		else
		  render "products/show"
		end
	end

	def destroy
		Review.find(params[:id]).destroy
		redirect_to product_path(params[:product_id])
	end

	private
	def reviews_params
		params.require(:review).permit(:review)
	end
end
