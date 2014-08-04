class ModifyVesselTypeForVessels < ActiveRecord::Migration
  def change
    remove_column :vessels, :vessel_type
    add_column :vessels, :vessel_type_id, :integer
  end
end
