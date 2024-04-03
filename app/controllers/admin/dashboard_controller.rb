# app/controllers/admins/dashboard_controller.rb
class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!
  before_action :check_main_admin

  def index
    # Admin dashboard logic
  end

  private

  def check_main_admin
    unless current_admin.email == 'pychangeric@gmail.com'
      redirect_to root_path, alert: 'Access Denied!'
    end
  end
end
