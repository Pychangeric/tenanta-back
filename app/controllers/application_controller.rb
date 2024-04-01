class ApplicationController < ActionController::Base
    before_action :authenticate_user! # This line ensures that users must be authenticated before accessing any action
  
    private
  
    def after_sign_in_path_for(resource)
      stored_location_for(resource) || user_path(current_user)
    end
  end
  