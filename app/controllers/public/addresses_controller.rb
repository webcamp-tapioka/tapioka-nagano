class Public::AddressesController < Public::ApplicationController

def create
  @address = current_user.addresses.new(address_params)
  @addresses = current_user.addresses.all
  if @address.save
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



