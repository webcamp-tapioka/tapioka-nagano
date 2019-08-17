class Public::OrdersController < ApplicationController
  
  def new
    @addresses = current_user.addresses.all
  end



end
