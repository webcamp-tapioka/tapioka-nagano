class Public::AddressesController < ApplicationController

def new
  @new_address = current_user.addresses.new
end

def create
  new_address = current_user.addresses.new(address_params)
  new_address.save
  redirect_to 'new'
end

def destroy
  current_user.addresses.find(params[:id]).destroy
end



private
  def address_params
    params.require(:address).permit(:delivery_postal_code,
     :delivery_address, :delivery_address_flag, delivery_name: [])
  end

  
end
