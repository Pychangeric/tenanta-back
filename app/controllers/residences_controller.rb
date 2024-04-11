class ResidencesController < ApplicationController
    before_action :set_residence, only: [:show]
  
    # GET /residences
    def index
      @residences = Residence.all
    end
  
    # GET /residences/1
    def show
      # Only allow users to view the house details, not update them
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions
    def set_residence
      @residence = Residence.find(params[:id])
    end
    def residence_params
      params.require(:residence).permit(:house_code, :type, :status, :price, :town, :google_maps, :user_agreement, :description, :institution, :contact_number, :user_agreement_file, snapshots: [], photos_attributes: [:id, :image])
    end
    
  end
  