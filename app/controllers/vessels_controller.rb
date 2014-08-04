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
      flash[:success] = "Successfully created new vessel."
      redirect_to vessels_path
    else
      flash[:error] = "There was an error in creating a new vessel."
      render :new
    end
  end

  def edit
    @vessel = Vessel.find(params[:id])
  end

  def update
    @vessel = Vessel.find(params[:id])
    
    if @vessel.update(vessel_params)
      flash[:success] = "Successfully updated vessel."
      redirect_to vessels_path
    else
      flash[:error] = "There was an error in updating vessels."
      render :edit
    end
  end

  def show
    @vessel = Vessel.find(params[:id])
  end

  def destroy
    vessel = Vessel.find(params[:id])
    vessel.destroy
    flash[:success] = "Successfully deleted vessel."
    redirect_to vessels_path
  end

  def vessel_params
    params.require(:vessel).permit!
  end

end
