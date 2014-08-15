class CreateTransmittalRecords < ActiveRecord::Migration
  def change
    create_table :transmittal_records do |t|
      t.string :prepared_by
      t.string :prepared_by_position
      t.string :approved_by
      t.string :approved_by_position
      t.string :noted_by
      t.string :noted_by_position
      t.string :destination
      t.date :date_of_departure
      t.date :prepared_on
      t.integer :vessel_id
      t.string :transmittal_code

      t.timestamps
    end
  end
end
