class CreateTransmittalRecordDisembarkingCrews < ActiveRecord::Migration
  def change
    create_table :transmittal_record_disembarking_crews do |t|
      t.integer :transmittal_record_id
      t.integer :crew_id
      t.integer :rank_id
      t.integer :reason_for_disembarkation_id
      t.date :date_embarked

      t.timestamps
    end
  end
end
