module Api
  class VesselsController < ApiController
    before_filter :authenticate_api_user!

    def crew_list
      render json: CrewListBuilderService.crew_list_by_vessel(params[:vessel_id])
    end
  end
end
