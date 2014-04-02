class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.integer :crew_id
      t.string :name
      t.string :certificate_number
      t.date :date_issued
      t.date :expiry_date

      t.timestamps
    end
  end
end
