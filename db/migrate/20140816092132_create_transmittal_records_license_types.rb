class CreateTransmittalRecordsLicenseTypes < ActiveRecord::Migration
  def change
    drop_table :transmittal_records_licenses
    create_table :transmittal_records_license_types, id: false do |t|
      t.references :transmittal_record
      t.references :license_type
    end
    add_index :transmittal_records_license_types, [:transmittal_record_id, :license_type_id], unique: true, name: 'tr_index'
  end
end
