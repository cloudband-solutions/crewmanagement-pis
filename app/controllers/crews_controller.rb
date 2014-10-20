class CrewsController < ApplicationController
  layout :resolve_layout
  before_filter :authenticate_user!

  def advanced_search
    if %w( admin encoder manager ).include? current_user.user_type
      @crews = Crew.order("crews.lastname")
    elsif current_user.user_type == "principal"
      @crews = Crew.order("crews.lastname")
    end

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

  def reports
    if params[:commit].present?
      if params[:commit] == "Display"
        generate_crew_list
      elsif params[:commit] == "Download"
      end
    end
  end

  def generate_crew_file
    @crew = Crew.find(params[:id])
    @root_url = request.env['HTTP_HOST']
    
    if params[:template].present?
      template = params[:template]
      if template == "misuga"
        pdf = MisugaReportPdf.new(@crew, view_context)
        #send_data pdf.render, filename: "crew.pdf", type: "application/pdf"
        send_file "#{Rails.root}/app/pdfs/MisugaReport.pdf", :type =>'application/pdf', :disposition => 'attachment'
      elsif template == "baliwag"
        pdf = BaliwagReportPdf.new(@crew, view_context)
        send_file "#{Rails.root}/app/pdfs/BaliwagReport.pdf", :type =>'application/pdf', :disposition => 'attachment'
      else
        flash[:error] = "Template #{template} not available"
        redirect_to crew_path(@crew)
      end
    else
      flash[:error] = "Please select a template"
      redirect_to crew_path(@crew)
    end
  end

  def generate_crew_list
    @crews = Crew.active.order(:lastname)

    if params[:vessel_id].present?
      @vessel = Vessel.find(params[:vessel_id])
      @crews = @crews.where(vessel_id: @vessel.id)
    end

    if params[:rank_id].present?
      @rank = Rank.find(params[:rank_id])
      @crews = @crews.where(rank_id: @rank.id)
    end
  end

  def index
    if %w( admin encoder manager ).include? current_user.user_type
      @crews = Crew.active.order("crews.lastname")
    elsif current_user.user_type == "principal"
      @crews = Crew.active.order("crews.lastname")
    end

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
  	@crew = Crew.active.find(params[:id])
  end

  def new
    @crew = Crew.new
  end
  
  def create
    @crew = Crew.new(crew_params)
    if params[:new_vessel].present?
      vessel = Vessel.new(name: params[:new_vessel].upcase, code: params[:new_vessel].upcase)
      
      if vessel.save
        params[:crew][:vessel_id] = vessel.id
        if @crew.save
          flash[:success] = "Successfully saved crew record."
          redirect_to crew_path(@crew)
        else
          flash.now[:error] = "Please check the form for some errors. #{@crew.errors.full_messages.to_sentence}"
          render :new
        end
      else
        flash[:error] = "Invalid vessel name"
        render :new
      end
    end
  end

  def edit
    @crew = Crew.find(params[:id])
  end

  def update
    @crew = Crew.find(params[:id])

    if params[:new_vessel].present?
      vessel = Vessel.new(name: params[:new_vessel].upcase, code: params[:new_vessel].upcase)
      
      if vessel.save
        params[:crew][:vessel_id] = vessel.id
        if @crew.update(crew_params)
          flash[:success] = "Successfully saved crew record."
          redirect_to crew_path(@crew)
        else
          flash.now[:error] = "Please check the form for some errors. #{@crew.errors.full_messages.to_sentence}"
          render :edit
        end
      else
        flash[:error] = "Invalid vessel name"
        render :edit
      end
    
    else 
      if @crew.update_attributes(crew_params)
        redirect_to crew_path(@crew)
      else
        render :edit
      end
    end

  end

  # NOTE: We only archive a crew deleted via the main application
  # Admin users can toggle the archived status of a crew via admin
  def destroy
    crew = Crew.find(params[:id])
    crew.is_archived = true
    crew.save!
    flash[:success] = "Successfully archived crew record."
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
