class CreateTransmittalRecordEmbarkingCrews < ActiveRecord::Migration
  def change
    create_table :transmittal_record_embarking_crews do |t|
      t.integer :transmittal_record_id
      t.integer :crew_id
      t.integer :rank_id

      t.timestamps
    end
  end
end
