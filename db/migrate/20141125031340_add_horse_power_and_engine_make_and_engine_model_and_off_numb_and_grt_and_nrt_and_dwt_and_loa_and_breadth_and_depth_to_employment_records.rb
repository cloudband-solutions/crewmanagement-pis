class AddHorsePowerAndEngineMakeAndEngineModelAndOffNumbAndGrtAndNrtAndDwtAndLoaAndBreadthAndDepthToEmploymentRecords < ActiveRecord::Migration
  def change
    add_column :employment_records, :horse_power, :integer
    add_column :employment_records, :engine_make, :string
    add_column :employment_records, :engine_model, :string
    add_column :employment_records, :off_numb, :string
    add_column :employment_records, :grt, :decimal
    add_column :employment_records, :nrt, :decimal
    add_column :employment_records, :dwt, :decimal
    add_column :employment_records, :loa, :decimal
    add_column :employment_records, :breadth, :decimal
    add_column :employment_records, :depth, :decimal
  end
end
