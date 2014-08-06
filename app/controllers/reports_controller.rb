class ReportsController < ApplicationController
  layout "plain"

  def misuga
    @crew = Crew.find(params[:crew_id])
  end
end
