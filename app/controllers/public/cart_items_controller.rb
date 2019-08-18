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
		cart_items = current_user.cart_items
		cart_items = Cart_item.new(cart_items_params)
		cart_items.save
	end

private
	def cart_item_params
		params.require(:cart_item).permit(:taile, :price, :product_amount, :product_status_id, :label_id)
	end

end
