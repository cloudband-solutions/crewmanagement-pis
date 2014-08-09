class ReportsController < ApplicationController
  layout "plain"

  def misuga
    @crew = Crew.find(params[:crew_id])
  end

  def baliwag_nav_biodata 
  	@crew = Crew.find(params[:crew_id])
  end
end

