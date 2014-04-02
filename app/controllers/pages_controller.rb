# File: pages_controller.rb
# Class name: PagesController
# Make sure to extend ApplicationController using <
# Each controller corresponding view directory under app/views with the same name.
class PagesController < ApplicationController

  # Each controller method corresponds to a .html.erb of the same name
  # for that controller's view directory.
  # i.e. index --> app/views/pages/index.html.erb
  def index
    @message = "Hello world!"
  end
  
end