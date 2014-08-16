class CreateManyToManyTransmittalRecordLicensType < ActiveRecord::Migration
  def change
    drop_table :transmittal_records_license_types
    create_table :transmittal_record_license_types, id: false do |t|
      t.references :transmittal_record
      t.references :license_type
    end
    add_index :transmittal_record_license_types, [:transmittal_record_id, :license_type_id], unique: true, name: 'tr_lt_index'
  end
end
