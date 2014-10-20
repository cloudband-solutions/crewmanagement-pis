class AddOtherVesselAndIsOtherVesselToEmploymentRecords < ActiveRecord::Migration
  def change
    add_column :employment_records, :other_vessel, :string
    add_column :employment_records, :is_other_vessel, :boolean
  end
end
