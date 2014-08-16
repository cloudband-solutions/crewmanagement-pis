class CreateTransmittalRecordsLicenses < ActiveRecord::Migration
  def change
    drop_table :transmittal_forms_licenses

    create_table :transmittal_records_licenses, id: false do |t|
      t.references :transmittal_record
      t.references :license
    end

    add_index :transmittal_records_licenses, [:transmittal_record_id, :license_id], unique: true, name: 'tr_license_index'
  end
end
