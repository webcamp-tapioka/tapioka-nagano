<<<<<<< HEAD
class Admin::AdminsController < ApplicationController
=======
class Admin::AdminsController < Admin::ApplicationController
>>>>>>> origin/master

	def show
		@orders = Order.where.not(order_status_id: 2)
	end

	def edit
		@postage_and_consumptiontaxes = PostageAndConsumptiontax.find(1)
	end

end