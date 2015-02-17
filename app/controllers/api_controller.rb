class ApiController < ActionController::Base

  protect_from_forgery with: :null_session

  def authenticate_token!
    if params[:access_token].blank?
      render json: "Access token required", status: 500
    elsif ApiKey.where(access_token: params[:access_token]).first.nil?
      render json: "Invalid access token", status: 500
    end
  end

  def authenticate_api_user!
    if !user_signed_in?
      render json: "Please sign in first", status: 500
    end
  end

end
