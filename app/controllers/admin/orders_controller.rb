class Admin::OrdersController < Admin::ApplicationController

  def index
    @orders = Order.preload(:order_products)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_root_path
end
private
def order_params
	params.require(:order).permit(:order_status_id)
end

end





