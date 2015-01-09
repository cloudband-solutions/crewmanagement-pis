class CrewsController < ApplicationController
  layout :resolve_layout
  before_filter :authenticate_user!

  def advanced_search
    if params[:search].nil?
      @crews = Crew.active
    else
      if !params[:search][:name].nil?
        params[:search][:name] = params[:search][:name].upcase
      end

      query = params[:search]

      @crews = SearchService.advanced_search(query)
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
        pdf_str = render_to_string(
         :pdf => 'MisugaReport',
         :template => "crews/misuga",
         :page_size => 'Legal',
         :layout => false,
         :locals => { :crew => @crew } )
        
        send_data(pdf_str, :filename => 'Misuga Report.pdf',  :type=>"application/pdf")

        #save_path = Rails.root.join('app/pdfs','MisugaReport.pdf')
        #File.open(save_path, 'wb') do |file|
        #  file << pdf_str
        #end
        #send_file "#{Rails.root}/app/pdfs/MisugaReport.pdf", :type =>'application/pdf', :disposition => 'attachment'
      elsif template == "baliwag"
        pdf_str = render_to_string(
         :pdf => 'BaliwagReport',
         :template => "crews/baliwag",
         :layout => false,
         page_size: 'Legal',
         :locals => { :crew => @crew } )

        send_data(pdf_str, :filename => 'Baliwag Report.pdf',  :type=>"application/pdf")
        
      elsif template == "fleet_personnel"
        pdf_str = render_to_string(
         :pdf => 'FleetPersonnelReport',
         :template => "crews/fleet_personnel",
         :layout => false,
         :locals => { :crew => @crew } )
        
        send_data(pdf_str, :filename => 'Fleet Personnel Report.pdf',  :type=>"application/pdf")

      elsif template == "dcm"
        pdf_str = render_to_string(
         :pdf => 'DCMReport',
         :template => "crews/dcm",
         :layout => false,
         :locals => { :crew => @crew } )
        
        send_data(pdf_str, :filename => 'DCM Report.pdf',  :type=>"application/pdf")
        
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
      @q.split(" ").each do |n|
        @crews = @crews.where("crews.firstname LIKE :q OR crews.middlename LIKE :q OR crews.lastname LIKE :q", q: "%#{n}%")
      end
    end

    if params[:code_number].present?
      @code_number = params[:code_number]
      @crews = @crews.where("crews.code_number LIKE :q", q: "%#{@code_number}%")
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

    if @crew.save
      flash[:success] = "Successfully saved crew record."
      redirect_to crew_path(@crew)
    else
      flash.now[:error] = "Please check the form for some errors. #{@crew.errors.full_messages.to_sentence}"
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
      flash.now[:error] = "Please check the form for some errors. #{@crew.errors.full_messages.to_sentence}"
      render :edit
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
