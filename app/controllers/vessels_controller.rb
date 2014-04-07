class VesselsController < ApplicationController

  def index
    @vessels = Vessel.all
  end

  def new
    @vessel = Vessel.new
  end  


end
