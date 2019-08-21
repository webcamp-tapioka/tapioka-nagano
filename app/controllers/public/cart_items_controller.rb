class Public::CartItemsController < ApplicationController

	def create
		if new_cart_item = current_user.cart_items.create(product_id: params[:product_id], 
			product_amount: cart_item_params[:product_amount])
			product = Product.find(params[:product_id])
			n = product.amount - new_cart_item.product_amount
			if n > 0
				product.update(amount: n)
			elsif n === 0
				product.update(amount: n, product_status_id: 1)
			end
		end
		redirect_to cart_items_path
	end

	def index
		@cart_items = current_user.cart_items
	end

	def update
		@cart_items = current_user.cart_items
		cart_item = @cart_items.find(params[:id])
		if cart_item.update(cart_item_params)
			product = Product.find(cart_item.product_id)
			n = product.amount - cart_item.product_amount
			if n > 0
				product.update(amount: n)
			elsif n === 0
				product.update(amount: n, product_status_id: 1)
			end
		end



		redirect_to cart_items_path
	end

	def destroy
		@cart_items = current_user.cart_items.find(params[:id])
		@cart_items.destroy
		redirect_to cart_items_path
	end

	

private
	def cart_item_params
		params.require(:cart_item).permit(:product_id, :product_amount)
	end

end
