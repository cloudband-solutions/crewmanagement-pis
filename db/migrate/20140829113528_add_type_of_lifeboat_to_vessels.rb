class AddTypeOfLifeboatToVessels < ActiveRecord::Migration
  def change
    add_column :vessels, :type_of_lifeboat, :string
  end
end
