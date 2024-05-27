class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  include Rails.application.routes.url_helpers

  def new
    super
  end

  def create
    puts "Params: #{params.inspect}" # Log the entire params object

    user_params = {
      first_name: params[:firstName],
      last_name: params[:lastName],
      email: params[:email],
      phone_number: params[:phoneNumber],
      password: params[:password],
      password_confirmation: params[:confirmPassword]
    }

    @user = User.new(user_params)

    if @user.save
      redirect_to new_payment_path, notice: "Please make a payment to activate your account."
    else
      puts "User save errors: #{@user.errors.full_messages.join(", ")}" # Log validation errors
      render :new
    end
  end

  def edit
    super
  end

  def destroy
    super
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number])
  end

  def after_sign_up_path_for(resource)
    super(resource)
  end
end
