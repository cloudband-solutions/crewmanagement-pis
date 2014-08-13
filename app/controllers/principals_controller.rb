class PrincipalsController < ApplicationController 
	def index 
		@principals = Principal.all
	end

	def show
		@principal = Principal.find(params[:id])
		
	end
	

end