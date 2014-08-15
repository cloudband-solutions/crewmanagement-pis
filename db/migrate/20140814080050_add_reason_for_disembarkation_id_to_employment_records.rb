class AddReasonForDisembarkationIdToEmploymentRecords < ActiveRecord::Migration
  def change
    remove_column :employment_records, :reason_for_disembarkation
    add_column :employment_records, :reason_for_disembarkation_id, :integer
  end
end
