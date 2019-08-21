class Public::AddressesController < ApplicationController

def create
  current_user.addresses.create(address_params)
  #redirect_back(fallback_location: root_path)
  redirect_to(session[:referrer])
  session.delete(:referrer)
end


def edit
  @address = current_user.addresses.find(params[:id])
  @addresses = current_user.addresses.all
  render 'index'

end

def update
  current_user.addresses.find(params[:id]).update(address_params)
  redirect_to addresses_path
end


def index
  #繊維元のURLをsession[:referrer]に格納
  session[:referrer] = request.referrer
  #redirect_back(fallback_location: root_path)
  #binding.pry
  @address = current_user.addresses.new
  @addresses = current_user.addresses.all
end


def destroy
  current_user.addresses.find(params[:id]).destroy
  redirect_to addresses_path
end



  private
  def address_params
    params.require(:address).permit(:delivery_postal_code,
     :delivery_address, :delivery_address_flag, :delivery_name, :delivery_name_kana)
  end

  
end



