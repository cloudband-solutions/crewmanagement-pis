class AddPrincipalIdToEmploymentRecords < ActiveRecord::Migration
  def change
    add_column :employment_records, :principal_id, :integer
  end
end
