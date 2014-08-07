class CrewsController < ApplicationController
  layout :resolve_layout
  before_filter :authenticate_user!

  def index
  	@crews = Crew.all
  end

  def show
  	@crew = Crew.find(params[:id])
  end

  def show_plain
  	@crew = Crew.find(params[:crew_id])
  end
  
  def print_report
    @crew = Crew.find(params[:crew_id])
    pdf = PDFKit.new(HTTParty.get(crew_show_plain_url(@crew)))

    send_data pdf, filename: "#{@crew}.pdf",
                  type: "application/pdf",
                  disposition: "inline"
  end

  def new
    @crew = Crew.new
  end
  
  def create
    @crew = Crew.new(crew_params)
    
    if @crew.save
      flash[:success] = "Successfully created new crew."
      redirect_to crews_path
    else
      flash[:error] = "Please check the form for some errors. #{@crew.errors.messages}"
      render :new
    end
  end

  def edit
    @crew = Crew.find(params[:id])
  end

  def update
    @crew = Crew.find(params[:id])
    
    if @crew.update(crew_params)
      flash[:success] = "Successfully saved crew record."
      redirect_to crews_path
    else
      render :edit
    end
  end

  def destroy
    crew = Crew.find(params[:id])
    crew.destroy
    redirect_to crews_path
  end

  private

  def resolve_layout
    case action_name
    when "show_plain"
      "plain"
    else
      "application"  
    end
  end

  def crew_params
    params.require(:crew).permit!
  end

end
