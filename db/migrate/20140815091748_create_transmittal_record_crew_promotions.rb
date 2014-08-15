class CreateTransmittalRecordCrewPromotions < ActiveRecord::Migration
  def change
    create_table :transmittal_record_crew_promotions do |t|
      t.integer :crew_id
      t.integer :from_rank_id
      t.integer :to_rank_id
      t.integer :transmittal_record_id

      t.timestamps
    end
  end
end
