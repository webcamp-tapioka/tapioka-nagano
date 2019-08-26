class Public::CartItemsController < Public::ApplicationController

	def create
		new_cart_item = current_user.cart_items.create!(product_id: params[:product_id], 
		product_amount: cart_item_params[:product_amount])
		redirect_to cart_items_path
	end

	def index
		@cart_items = current_user.cart_items
	end

	def update
		cart_item = current_user.cart_items.find(params[:id])
		cart_item.product_amount = cart_item_params[:product_amount]
		if cart_item.product_amount > Product.find(cart_item.product_id).amount
			redirect_to cart_items_path, notice: "在庫が足りないため、更新できません"
			return
		elsif Product.find(cart_item.product_id).product_status_id_before_type_cast == 1
			redirect_to cart_items_path, notice: "この商品は販売停止中です"
			return
		end
		cart_item.update(cart_item_params)
		redirect_to cart_items_path, notice: "更新しました"
		return
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
