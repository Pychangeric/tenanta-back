class Leaders::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  include Rails.application.routes.url_helpers

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    build_resource(sign_up_params)
    resource.first_name = params[:leader][:first_name]
    resource.last_name = params[:leader][:last_name]
    resource.phone_number = params[:leader][:phone_number]
    resource.national_id = params[:leader][:national_id]
    resource.gender = params[:leader][:gender]

    if resource.save
      redirect_to leaders_dashboard_path, notice: "Successfully signed up. Please wait for approval."
    else
      clean_up_passwords resource
      set_minimum_password_length
      render :new
    end
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    @leader = current_leader
    if @leader.update(leader_params)
      flash[:success] = "Profile updated successfully"
      redirect_to leaders_profile_path
    else
      render :edit
    end
  end

  # DELETE /resource
  def destroy
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :national_id, :gender, :profile_picture])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    leaders_dashboard_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
