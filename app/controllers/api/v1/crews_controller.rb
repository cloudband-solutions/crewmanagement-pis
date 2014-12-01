module Api
  module V1
    class CrewsController < ApiController
      before_filter :authenticate_token!

      def profile
        crew = Crew.where(crew_token: params[:crew_token]).first

        if crew.nil?
          render json: "No crew found", status: 500
        else

          render json: crew.build_json
        end
      end
    end
  end
end
