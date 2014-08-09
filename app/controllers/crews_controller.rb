class CrewsController < ApplicationController
  layout :resolve_layout
  before_filter :authenticate_user!

  def index
  	@crews = Crew.select("*").order("crews.lastname")

    if params[:q].present?
      @q = params[:q]
      @crews = @crews.where("crews.firstname LIKE :q OR crews.middlename LIKE :q OR crews.lastname LIKE :q", q: "%#{@q}%")
    end

    if params[:vessel_id].present?
      @vessel = Vessel.find(params[:vessel_id])
      @crews = @crews.where("crews.vessel_id = ?", @vessel.id)
    end

    if params[:rank_id].present?
      @rank = Rank.find(params[:rank_id])
      @crews = @crews.where("crews.rank_id = ?", @rank.id)
    end

    @crews = @crews.page(params[:page]).per(10)
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
      redirect_to crew_path(@crew)
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
      redirect_to crew_path(@crew)
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
