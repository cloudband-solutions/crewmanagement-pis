class CrewsController < ApplicationController

  def index
  	@crews = Crew.all
  end

  def show
  	@crew = Crew.find_by_id(params[:id])
  end

  def new
    @crew = Crew.new
  end

end
