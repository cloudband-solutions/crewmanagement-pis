class AddGrainToVessels < ActiveRecord::Migration
  def change
    add_column :vessels, :grain, :decimal
  end
end
