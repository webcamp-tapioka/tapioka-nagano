class Public::CartItemsController < ApplicationController

	def index
		@cart_items = current_user.cart_items
	end

	def update
		@cart_items = current_user.cart_items
		cart_item = @cart_items.find(params[:id])
		cart_item.update(cart_item_params)
		redirect_to cart_items_path
	end

	def destroy
		@cart_items = current_user.cart_items.find(params[:id])
		@cart_items.destroy
		redirect_to cart_items_path
	end

	def create
		cart_items = current_user.cart_items.create!(product_id: params[:product_id],product_amount: 1)
		redirect_to cart_items_path
		
	end

private
	def cart_item_params
		params.require(:product).permit(:user_id, :product_id, :product_amount)
	end

end
