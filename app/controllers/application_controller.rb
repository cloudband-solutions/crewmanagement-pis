class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == "new"
      "plain"
    else
      "application"
    end
  end
end
