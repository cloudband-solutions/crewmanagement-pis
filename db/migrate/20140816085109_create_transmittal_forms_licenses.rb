class CreateTransmittalFormsLicenses < ActiveRecord::Migration
  def change
    create_table :transmittal_forms_licenses, id: false do |t|
      t.integer :transmittal_form_id
      t.integer :license_id

    end

    add_index :transmittal_forms_licenses, [:transmittal_form_id, :license_id], unique: true, name: 'tr_license_index'
  end
end
