class VesselsController < ApplicationController

  def index
    @vessels = Vessel.all
  end

  def new
    @vessel = Vessel.new
  end  

  def create
    @vessel = Vessel.new(vessel_params)
    if @vessel.save
      redirect_to vessels_path
    else
      render :new
    end
  end

  def edit
    @vessel = Vessel.find(params[:id])
  end

  def update
    @vessel = Vessel.find(params[:id])
    
    if @vessel.update(vessel_params)
      redirect_to vessels_path
    else
      render :edit
    end
  end

  def destroy
    vessel = Vessel.find(params[:id])
    vessel.destroy
    redirect_to vessels_path
  end

  def vessel_params
    params.require(:vessel).permit(:name, :flag, :vessel_type, :horse_power, :engine_make)
  end

end
