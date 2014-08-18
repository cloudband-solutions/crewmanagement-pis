class RemoveReasonForDisembarkationFromEmploymentRecrds < ActiveRecord::Migration
  def change
    remove_column :employment_records, :reason_of_disembarkation
  end
end
