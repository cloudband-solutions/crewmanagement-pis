class AddDateEmbarkedToTransmittalRecordCrewPromotions < ActiveRecord::Migration
  def change
    add_column :transmittal_record_crew_promotions, :date_embarked, :date
  end
end
