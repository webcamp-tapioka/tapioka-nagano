class ApplicationController < ActionController::Base


before_action :configure_permitted_parameters, if: :devise_controller?


def after_sign_in_path_for(resource)
   	  if resource.is_a?(User)
 	     products_path(resource)
       elsif resource.is_a?(Admin)
	     admin_root_path
      end
end

<<<<<<< HEAD
=======

>>>>>>> origin/master
private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number ])
  end
end
