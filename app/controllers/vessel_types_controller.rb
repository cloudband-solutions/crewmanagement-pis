class VesselTypesController < ApplicationController

  def index
    @vessel_types = VesselType.all
  end

  def new
    @vessel_type = VesselType.new
  end  

  def create
    @vessel_type = VesselType.new(vessel_type_params)
    if @vessel_type.save
      flash[:success] = "Successfully created new vessel_type."
      redirect_to vessel_types_path
    else
      flash[:error] = "There was an error in creating a new vessel_type."
      render :new
    end
  end

  def edit
    @vessel_type = VesselType.find(params[:id])
  end

  def update
    @vessel_type = VesselType.find(params[:id])
    
    if @vessel_type.update(vessel_type_params)
      flash[:success] = "Successfully updated vessel_type."
      redirect_to vessel_types_path
    else
      flash[:error] = "There was an error in updating vessel_types."
      render :edit
    end
  end

  def show
    @vessel_type = VesselType.find(params[:id])
  end

  def destroy
    vessel_type = VesselType.find(params[:id])
    vessel_type.destroy
    flash[:success] = "Successfully deleted vessel_type."
    redirect_to vessel_types_path
  end

  def vessel_type_params
    params.require(:vessel_type).permit!
  end

end

