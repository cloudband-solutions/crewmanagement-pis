class TransmittalRecordsController < ApplicationController
  def index
    @transmittal_records = TransmittalRecord.where("status = 'pending' OR status = 'approved' OR status = 'on-transit'").order("status DESC").page(params[:page]).per(20)

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

  def new
    @transmittal_record = TransmittalRecord.new
  end

  def create
    @transmittal_record = TransmittalRecord.new(tr_params)

    if @transmittal_record.save
      flash[:success] = "Successfully saved transmittal record"
      redirect_to transmittal_records_path
    else
      flash[:error] = "Error in saving transmittal record."
      render :new
    end
  end

  def show
    @transmittal_record = TransmittalRecord.find(params[:id])
  end

  def edit
    @transmittal_record = TransmittalRecord.find(params[:id])
  end

  def update
    @transmittal_record = TransmittalRecord.find(params[:id])

    if @transmittal_record.update(tr_params)
      flash[:success] = "Successfully saved transmittal record"
      redirect_to transmittal_records_path
    else
      flash[:error] = "Error in saving transmittal record."
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
