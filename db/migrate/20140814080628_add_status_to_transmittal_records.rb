class AddStatusToTransmittalRecords < ActiveRecord::Migration
  def change
    add_column :transmittal_records, :status, :string
  end
end
