class PagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @crew_added = Crew.active.order("crews.created_at").last
    @crew_updated = Crew.active.order("crews.updated_at").last
    @transmittal_pending_records = TransmittalRecord.where(status: "pending").order(:prepared_on).limit(5)
    @transmittal_ontransit_records = TransmittalRecord.where(status: "on-transit").order(:prepared_on).limit(5)

    @crews = Crew.all

    if current_user.is_principal? 
      @vessel_types = VesselType.all
      @ranks = Rank.all
    end

  end
  

end
