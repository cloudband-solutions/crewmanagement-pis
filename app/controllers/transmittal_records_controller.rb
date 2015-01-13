class TransmittalRecordsController < ApplicationController
  def index
    @transmittal_records = TransmittalRecord.where("status = 'pending' OR status = 'approved' OR status = 'on-transit'").order("status DESC").order("date_of_departure DESC").page(params[:page]).per(20)

    if params[:vessel_id].present?
      @vessel = Vessel.find(params[:vessel_id])
      @transmittal_records = @transmittal_records.where(vessel_id: @vessel.id)
    end

    if params[:status].present?
      @status = params[:status]
      @transmittal_records = @transmittal_records.where(status: @status)
    end

    if params[:destination].present?
      @destination = params[:destination]
      @transmittal_records = @transmittal_records.where(destination: @destination)
    end

    @transmittal_records = @transmittal_records.page(params[:page]).per(20)
  end

  def new_tr
    vessel_id = Vessel.find(params[:vessel_id]).id
    redirect_to new_transmittal_record_path(vessel_id)
  end

  def new
    if params[:vessel_id].blank?
      flash[:error] = "No Vessel ID specified."
      redirect_to transmittal_records_path
    end

    @vessel = Vessel.find(params[:vessel_id])

    if @vessel.nil?
      flash[:error] = "No vessel found."
      redirect_to transmittal_records_path
    end

    if TransmittalRecord.where(vessel_id: @vessel.id, status: "pending").count > 0
      flash[:error] = "There are still pending records for vessel #{@vessel}"
      redirect_to transmittal_records_path
    end

    @transmittal_record = TransmittalRecord.new(vessel_id: @vessel.id)
  end

  def create
    @transmittal_record = TransmittalRecord.new(tr_params)

    if @transmittal_record.save
      flash[:success] = "Successfully saved transmittal record"
      redirect_to transmittal_records_path
    else
      flash.now[:error] = "Error in saving transmittal record."
      raise @transmittal_record.errors.inspect
      render :new
    end
  end

  def show
    @transmittal_record = TransmittalRecord.find(params[:id])
  end

  def edit
    @transmittal_record = TransmittalRecord.find(params[:id])
    @vessel = @transmittal_record.vessel
  end

  def update
    @transmittal_record = TransmittalRecord.find(params[:id])

    if @transmittal_record.update(tr_params)
      flash[:success] = "Successfully saved transmittal record"
      redirect_to transmittal_records_path
    else
      flash.now[:error] = "Error in saving transmittal record."
      render :edit
    end
  end

  def transit
    @transmittal_record = TransmittalRecord.find(params[:id])
    @transmittal_record.transit!
    flash[:success] = "Successfully set transmittal record to on-transit"
    redirect_to transmittal_records_path
  end

  def approve
    @transmittal_record = TransmittalRecord.find(params[:id])
    @transmittal_record.approve!
    flash[:success] = "Successfully approved transmittal record"
    redirect_to transmittal_records_path
  end

  def destroy
    @transmittal_record = TransmittalRecord.find(params[:id])
    @transmittal_record.archive!
    flash[:success] = "Successfully archived transmittal record"
    redirect_to transmittal_records_path
  end

  private

  def tr_params
    params.require(:transmittal_record).permit!
  end
end
