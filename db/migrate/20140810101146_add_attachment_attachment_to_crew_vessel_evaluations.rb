class AddAttachmentAttachmentToCrewVesselEvaluations < ActiveRecord::Migration
  def self.up
    change_table :crew_vessel_evaluations do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :crew_vessel_evaluations, :attachment
  end
end
