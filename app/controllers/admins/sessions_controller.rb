# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super do |resource|
      # Your custom logic after sign-in, if needed
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
