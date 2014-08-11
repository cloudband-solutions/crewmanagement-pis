class AddAttachmentAttachmentToCrewOfficeEvaluations < ActiveRecord::Migration
  def self.up
    change_table :crew_office_evaluations do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :crew_office_evaluations, :attachment
  end
end
