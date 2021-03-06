class Public::UsersController < Public::ApplicationController
def show  
    @addresses = current_user.addresses.find_by(delivery_address_flag: 0)
    @sub_addresses = current_user.addresses.where(delivery_address_flag: 1)
  end

  def edit
  	@user = User.find(params[:id])
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to products_path
  end

  def leave
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
        redirect_to user_path(current_user),notice: "succsess!"
    else
      render :edit
    end
  end

  def index
  end



  private

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :phone_number)
  end

end
