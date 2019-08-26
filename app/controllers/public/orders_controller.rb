class Public::OrdersController < ApplicationController
  before_action :require_cart_items, except: :index
  before_action :require_product, only: :create
  
  def new
    @new_order = current_user.orders.new(postage: PostageAndConsumptiontax.find(1).postage, 
    total_price: current_user.total_price, consumption_tax: PostageAndConsumptiontax.find(1).consumption_tax)
    @addresses = current_user.addresses.all
    @cart_items = current_user.cart_items.all
    if params[:to_create_order]
      address = current_user.addresses.find(params[:to_create_order].to_i)
      @new_order = current_user.orders.new(delivery_postal_code: address.delivery_postal_code, 
      delivery_address: address.delivery_address, delivery_name: address.delivery_name, 
      delivery_name_kana: address.delivery_name_kana, postage: PostageAndConsumptiontax.find(1).postage, 
      total_price: current_user.total_price, consumption_tax: PostageAndConsumptiontax.find(1).consumption_tax)
    end
  end

  def create
    if new_order = current_user.orders.create(order_params)
      current_user.cart_items.all.each do |cart_item|
        new_order_product = new_order.order_products.build
        new_order_product.product_id = cart_item.product_id
        new_order_product.order_amount = cart_item.product_amount
        new_order_product.price = Product.find(cart_item.product_id).price
        new_order_product.save!
      end
    end
    current_user.cart_items.all.each do |cart_item|
      product = Product.find(cart_item.product_id)
			n = product.amount - cart_item.product_amount
			if n > 0
				product.update!(amount: n)
			elsif n === 0
				product.update!(amount: n, product_status_id: 1)

			end
		end

    # current_user.cart_items.destroy_all
    current_user.cart_items.each(&:destroy!)
    redirect_to users_thank_you_path

  end


  private

  def require_cart_items
    unless current_user.cart_items.last
      redirect_to products_path
    end
  end

  def require_product
    current_user.cart_items.all.each do |cart_item|
      if Product.find(cart_item.product_id).amount < cart_item.product_amount or Product.find(cart_item.product_id).product_status_id_before_type_cast == 1
        redirect_to cart_items_path, notice: "在庫が足りないか、商品が販売停止中です" and return
      end
    end
  end

  def order_params
    params.require(:order).permit(:delivery_postal_code, :delivery_address, :delivery_name, :delivery_name_kana, 
    :payment_method, :postage, :total_price, :consumption_tax)
  end
    
end
