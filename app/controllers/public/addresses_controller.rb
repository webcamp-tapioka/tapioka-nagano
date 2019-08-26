class Public::AddressesController < ApplicationController

def create
  @address = current_user.addresses.new(address_params)
  @addresses = current_user.addresses.all
  if @address.delivery_address_flag === "メイン住所"
    if current_user.addresses.find_by(delivery_address_flag: 0)
      current_user.addresses.find_by(delivery_address_flag: 0).update(delivery_address_flag: 1)
    end
  end
  if @address.save(address_params)
  redirect_to(session[:referrer])
  session.delete(:referrer)
  else
  render 'index'
  end
end


def edit
  @address = current_user.addresses.find(params[:id])
  @addresses = current_user.addresses.all
  render 'index'

end

def update
  if address_params[:delivery_address_flag] === "メイン住所"
    if current_user.addresses.find_by(delivery_address_flag: 0)
      current_user.addresses.find_by(delivery_address_flag: 0).update(delivery_address_flag: 1)
    end
  end
  @address = current_user.addresses.find(params[:id])
  @addresses = current_user.addresses.all
  if @address.update(address_params)
  redirect_to addresses_path
else
  render 'index'
end
end


def index
  session[:referrer] = request.referrer
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



