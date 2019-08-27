class Admin::UsersController < Admin::ApplicationController

def index
    @users = User.with_deleted
end


def show
    @user = User.with_deleted.find(params[:id])
    @addresses = @user.addresses.find_by(delivery_address_flag: 0)
		@sub_addresses = @user.addresses.where(delivery_address_flag: 1)
		@orders = User.with_deleted.find(params[:id]).orders.all
		

end

def update
  	@user = User.with_deleted.find(params[:id])
  	  if @user.update(user_params)
  	  	 redirect_to admin_users_path, notice: "succsess!"
  	  else
  	  	render :edit
  	  end
end

def edit
  	@user = User.with_deleted.find(params[:id])
  end

def destroy
		@user = User.with_deleted.find(params[:id])
  	@user.destroy
  	redirect_to admin_users_path
end
private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :phone_number)
  end

end

