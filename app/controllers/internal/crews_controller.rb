module Internal
  class CrewsController < ApplicationController
    def show
      render json: Crew.find(params[:id])
    end
  end
end
