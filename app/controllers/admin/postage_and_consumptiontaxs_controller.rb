class Admin::PostageAndConsumptiontaxsController < ApplicationController
def update
    @postage_and_consumptiontaxes = PostageAndConsumptiontax.find(1)
	@postage_and_consumptiontaxes.update(postage_and_consumptiontaxes_params)
	redirect_to edit_admin_admins_path
end

private
def postage_and_consumptiontaxes_params
	params.require(:postage_and_consumptiontax).permit(:postage, :consumption_tax)
end
end

