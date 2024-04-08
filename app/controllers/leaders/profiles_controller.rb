# app/controllers/leaders/profiles_controller.rb
class Leaders::ProfilesController < ApplicationController
  before_action :authenticate_leader!

  def show
    @leader = current_leader
  end
end
