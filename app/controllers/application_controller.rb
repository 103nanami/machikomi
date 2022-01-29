class ApplicationController < ActionController::Base

 before_action :configure_permitted_parameters, if: :devise_controller?

 protect_from_forgery with: :null_session

 def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name,:last_name_kana, :first_name_kana, :username, :old, :birth_year, :birth_month, :birth_day, :address, :postal_code, :sex])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
 end

 private

 def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admin_path
    else
      root_path
    end
 end

 def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      new_user_session_path
    end
 end


end
