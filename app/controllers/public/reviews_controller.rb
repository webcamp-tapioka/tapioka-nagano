class Public::ReviewsController < ApplicationController

	def create
		review = current_user.reviews.new(reviews_params)
		review.product_id = params[:product_id].to_i
		review.save
		redirect_to product_path(params[:product_id])
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
