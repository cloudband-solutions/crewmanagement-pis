class AddPrincipalIdToVessels < ActiveRecord::Migration
  def change
    add_column :vessels, :principal_id, :integer
  end
end
