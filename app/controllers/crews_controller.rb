class CrewsController < ApplicationController

  def index
    flash[:success] = "Displaying crew list"
  	@crews = Crew.all
  end

  def show
  	@crew = Crew.find_by_id(params[:id])
  end

  def new
    @crew = Crew.new
  end
  
  def create
    @crew = Crew.new(crew_params)
    
    if @crew.save
      redirect_to crews_path
    else
      render :new
    end
  end

  def edit
    @crew = Crew.find(params[:id])
  end

  def update
    @crew = Crew.find(params[:id])
    
    if @crew.update(crew_params)
      redirect_to crews_path
    else
      render :edit
    end
  end

  def destroy
    crew = Crew.find(params[:id])
    crew.destroy
    redirect_to crews_path
  end

  def crew_params
    params.require(:crew).permit!
  end

end
