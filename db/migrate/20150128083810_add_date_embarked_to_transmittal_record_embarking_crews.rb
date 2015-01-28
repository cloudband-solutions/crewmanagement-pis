class AddDateEmbarkedToTransmittalRecordEmbarkingCrews < ActiveRecord::Migration
  def change
    add_column :transmittal_record_embarking_crews, :date_embarked, :date
  end
end
