class PagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @crew_added = Crew.active.order("created_at").last
    @crew_updated = Crew.active.order("updated_at").last
  end
  
end
