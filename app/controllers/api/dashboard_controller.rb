module Api
  class DashboardController < ApplicationController

    before_filter :authenticate_api

    def crew_count_by_vessel
      labels = []
      data = []
      Vessel.all.each do |v|
        labels << v.name
        data << v.active_crews.count
      end

      render json: { labels: labels, data: data }
    end

    def crew_count_by_rank
      labels = []
      data = []
      Rank.all.each do |r|
        labels << r.name
        data << r.active_crews.count
      end

      render json: { labels: labels, data: data }
    end

    private

    def authenticate_api
      if !user_signed_in?
        render json: { message: "Unauthorized" }
      end
    end
  end
end
