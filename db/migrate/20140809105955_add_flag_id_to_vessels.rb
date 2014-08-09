class AddFlagIdToVessels < ActiveRecord::Migration
  def change
    add_column :vessels, :flag_id, :integer
  end
end
