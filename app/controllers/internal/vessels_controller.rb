module Internal
  class VesselsController < ApplicationController
    before_filter :authenticate_user!

    def crews
      v = Vessel.find(params[:vessel_id])

      render json: v.crews
    end

  end
end
