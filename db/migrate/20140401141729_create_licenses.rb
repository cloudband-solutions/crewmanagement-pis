class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.integer :crew_id
      t.string :country
      t.string :kind
      t.string :license_number
      t.date :date_issued
      t.date :expiry_date
      t.string :issued_by

      t.timestamps
    end
  end
end
