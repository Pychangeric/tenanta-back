class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:email])
      if user && user.valid_password?(params[:password])
      else
        flash.now[:alert] = 'Invalid email or password'
        render :new
      end
    end
  
    def destroy
    end
  end
  