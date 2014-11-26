module Api
  class DashboardController < ApplicationController

    before_filter :authenticate_api

    def crew_count_by_vessel
      data = []
      Vessel.active.each do |v|
        data << { name: v.name, count: v.active_crews.count }
      end

      render json: data
    end

    def crew_count_by_rank
      data = []
      Rank.all.each do |r|
        data << { name: r.name, count: r.active_crews.count }
      end

      render json: data
    end

    private

    def authenticate_api
      if !user_signed_in?
        render json: { message: "Unauthorized" }
      end
    end
  end
end
