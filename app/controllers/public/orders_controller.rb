class Public::OrdersController < ApplicationController
  
  def new
    @new_order = current_user.orders.new
    @addresses = current_user.addresses.all
    if params[:to_create_order]
      address = current_user.addresses.find(params[:to_create_order].to_i)
      @new_order = current_user.orders.new(delivery_postal_code: address.delivery_postal_code, 
      delivery_address: address.delivery_address, delivery_name: address.delivery_name, 
      delivery_name_kana: address.delivery_name_kana, postage: 0)
    end
    current_user.cart_items.all.each do |cart_item|
      @new_order.order_products.build(product_id: cart_item.product_id, 
      order_amount: cart_item.product_amount, 
      price: Product.find(cart_item.product_id).price)
    end
  end


  def create

    
  end




end
