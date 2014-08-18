class AddSignOffToTransmittalRecordDisembarkingCrews < ActiveRecord::Migration
  def change
    add_column :transmittal_record_disembarking_crews, :sign_off, :date
  end
end
