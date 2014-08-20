class ReportsController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def crew_manifest
    if request.post?
      if params[:vessel_id].blank?
        flash.now[:error] = "Please specify a vessel"  
      else
        @vessel = Vessel.find(params[:vessel_id])
        @license_types = LicenseType.where("license_types.id IN (?)", params[:license_types])
        @crews = Crew.all_by_vessel(@vessel)
      end
    end
  end
end

