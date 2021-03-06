class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

  before_filter :load_defaults

  def load_defaults
    if user_signed_in? and current_user.is_principal?
      @principal = current_user.principal
      @vessels = @principal.vessels
      @crews = Crew.active.where("crews.vessel_id IN (?)", @vessels.ids)
    end
  end

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == "new"
      "plain"
    else
      "application"
    end
  end
end
