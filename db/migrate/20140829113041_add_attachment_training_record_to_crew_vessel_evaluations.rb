class AddAttachmentTrainingRecordToCrewVesselEvaluations < ActiveRecord::Migration
  def self.up
    change_table :crew_vessel_evaluations do |t|
      t.attachment :training_record
    end
  end

  def self.down
    remove_attachment :crew_vessel_evaluations, :training_record
  end
end
