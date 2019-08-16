class Public::UsersController < ApplicationController
def show
    @addresses = current_user.addresses.find_by(delivery_address_flag: 0)
    @sub_addresses = current_user.addresses.where(delivery_address_flag: 1)
    
  end

  def edit
  	@user = User.find(params[:id])
  end

  def destroy
  	redirect_to products_path
  	@user.destroy
  	@user = User.find(params[:id])
  end

  def leave
  end

  def update
  	@user = User.find(params[:id])
  end

private
  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user)
    end
  end
end
