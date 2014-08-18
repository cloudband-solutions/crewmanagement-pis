class TransmittalRecordsController < ApplicationController
  def index
    @transmittal_records = TransmittalRecord.where(status: "pending")
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
