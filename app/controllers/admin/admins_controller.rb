class Admin::AdminsController < ApplicationController

def show
	@orders = Order.where.not(order_status_id: 2)
end

def edit
end

end
