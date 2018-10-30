# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

   def create
     self.resource = warden.authenticate!(auth_options)
     set_flash_message!(:notice, :signed_in)
     sign_in(resource_name, resource)
     yield resource if block_given?
     respond_to do |format|
       format.json { render json: resource, status: :created }
       format.html { respond_with resource, location: after_sign_in_path_for(resource) }
     end
   end
   
  # protected
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
