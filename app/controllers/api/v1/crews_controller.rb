module Api
  module V1
    class CrewsController < ApiController
      before_filter :authenticate_token!

      def profile
        crew = Crew.where(crew_token: params[:crew_token]).first

        render json: crew
      end
    end
  end
end
