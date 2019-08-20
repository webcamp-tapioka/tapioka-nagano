class Admin::UsersController < ApplicationController

def index
	@users = User.all
end


def show
end

def update
  	@user = User.find(params[:id])
  	  if @user.update(user_params)
  	  	 redirect_to admin_users_path,notice: "succsess!"
  	  else
  	  	render :edit
  	  end
end

def edit
  	@user = User.find(params[:id])
  end

def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to admin_users_path
end


end

