class Public::OrdersController < ApplicationController
  before_action :require_cart_items, except: :index

  
  def new
    @new_order = current_user.orders.new
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
    if new_order = current_user.orders.new(order_params)
      new_order.postage = PostageAndConsumptiontax.find(1).postage
      new_order.total_price = current_user.total_price
      new_order.consumption_tax = PostageAndConsumptiontax.find(1).consumption_tax
      new_order.save

      current_user.cart_items.all.each do |cart_item|
        new_order_product = new_order.order_products.build
        new_order_product.product_id = cart_item.product_id
        new_order_product.order_amount = cart_item.product_amount
        new_order_product.price = Product.find(cart_item.product_id).price
        new_order_product.save
      end
    current_user.cart_items.destroy_all
    redirect_to users_thank_you_path
    end
  end
  
  

  private

    def require_cart_items
      unless current_user.cart_items.last
        redirect_to products_path
      end
    end


    def order_params
      params.require(:order).permit(:delivery_postal_code, :delivery_address, :delivery_name, :delivery_name_kana, 
      :payment_method)
    end
    
end
