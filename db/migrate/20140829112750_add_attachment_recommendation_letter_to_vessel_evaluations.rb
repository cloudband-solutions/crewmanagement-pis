class AddAttachmentRecommendationLetterToVesselEvaluations < ActiveRecord::Migration
  def self.up
    change_table :crew_vessel_evaluations do |t|
      t.attachment :recommendation_letter
    end
  end

  def self.down
    remove_attachment :crew_vessel_evaluations, :recommendation_letter
  end
end
