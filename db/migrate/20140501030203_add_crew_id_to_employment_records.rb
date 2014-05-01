class AddCrewIdToEmploymentRecords < ActiveRecord::Migration
  def change
    add_column :employment_records, :crew_id, :integer
  end
end
