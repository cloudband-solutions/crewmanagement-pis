class AddTransmittalRecordIdToEmploymentRecords < ActiveRecord::Migration
  def change
    add_column :employment_records, :transmittal_record_id, :integer
  end
end
