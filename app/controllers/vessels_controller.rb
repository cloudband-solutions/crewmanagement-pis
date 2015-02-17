class VesselsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @vessels = Vessel.select("*").order(:name)

    if current_user.user_type == 'principal'
      @vessels = @principal.vessels.active
    end

    if params[:q].present?
      @q = params[:q].upcase
      @vessels = @vessels.where("name LIKE :q OR code LIKE :q", q: "%#{@q}%")
    end

    if params[:status].present?
      @status = params[:status]
      @vessels = @vessels.where("status = :q", q: "#{@status}")
    end

    if params[:flag_id].present?
      @flag = Flag.find(params[:flag_id])
      @vessels = @vessels.where(flag_id: @flag.id)
    end

    if params[:vessel_type_id].present?
      @vessel_type = VesselType.find(params[:vessel_type_id])
      @vessels = @vessels.where(vessel_type_id: @vessel_type.id)
    end

    @vessels = @vessels.page(params[:page]).per(10)
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
