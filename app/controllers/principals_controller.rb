class PrincipalsController < ApplicationController 
  before_filter :authenticate_user!

	def index 
		@principals = Principal.select("*")

    if params[:q].present?
      @q = params[:q]
      @principals = Principal.where("name LIKE :q", q: "%#{@q}%")
    end

    @principals = @principals.page(params[:page]).per(10)
	end

	def show
		@principal = Principal.find(params[:id])

    @vessels = @principal.vessels.page(params[:page]).per(10)
	end
	

end
