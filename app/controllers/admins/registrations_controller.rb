class Admins::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def create
    super do |resource|
      if resource.persisted?
        flash[:notice] = "Admin account created successfully!"
        redirect_to admin_dashboard_path
      else
        flash[:alert] = "Error creating admin account."
        render :new
      end
    end
  end

  protected

  def after_sign_up_path_for(resource)
    admin_dashboard_path
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :first_name, :last_name, :phone_number, :national_id, :gender])
  end
end
