class Leaders::ResidencesController < ApplicationController
  before_action :authenticate_leader!
  before_action :set_residence, only: [:show, :edit, :update, :destroy]

  def index
    @residences = Residence.all
  end

  def show
    # Only allow leaders to view the residence details
  end

  def new
    @residence = Residence.new
  end

  def create
    @residence = Residence.new(residence_params)
  
    if @residence.save
      redirect_to @residence, notice: 'Residence was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @residence.update(residence_params)
      redirect_to @residence, notice: 'Residence was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @residence.destroy
    redirect_to residences_url, notice: 'Residence was successfully destroyed.'
  end

  private

  def set_residence
    @residence = Residence.find(params[:id])
  end

  def residence_params
    params.require(:residence).permit(:house_code, :type, :status, :price, :town, :google_maps, :user_agreement, :description, :institution, :contact_number)
  end
end
