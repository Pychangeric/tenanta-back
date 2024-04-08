class Leaders::DashboardController < ApplicationController
  before_action :authenticate_leader!

  def index
    @leader = current_leader
    # Add logic to handle image attachment
    if params[:leader] && params[:leader][:image]
      @leader.profile_picture.attach(params[:leader][:image])
    end
    # Add additional logic for the dashboard here
  end
end
