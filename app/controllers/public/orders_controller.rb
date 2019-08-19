class Public::OrdersController < ApplicationController
  
  def new
    @new_order = current_user.orders.new
    @addresses = current_user.addresses.all
    if params[:to_create_order]
      address = current_user.addresses.find(params[:to_create_order].to_i)
      @new_order = current_user.orders.new(delivery_postal_code: address.delivery_postal_code, 
      delivery_address: address.delivery_address, delivery_name: address.delivery_name, 
      delivery_name_kana: address.delivery_name_kana, postage: PostageAndConsumptiontax.find(1).postage, 
      total_price: current_user.total_price, consumption_tax: PostageAndConsumptiontax.find(1).consumption_tax)
    end
    current_user.cart_items.all.each do |cart_item|
      @new_order.order_products.build(product_id: cart_item.product_id, 
      order_amount: cart_item.product_amount, 
      price: Product.find(cart_item.product_id).price)
    end
  end


  def create
    Order.create(order_params)
    redirect_to users_thank_you_path
  end
  


  private
    def order_params
      params.require(:order).permit(:delivery_postal_code, :delivery_address, :delivery_name, :delivery_name_kana, 
      :postage, :total_price, :consumption_tax, :payment_method, order_products_attributes: [:product_id, :order_amount, :price])
    end
    
end
