class AddPortOfRegistryAndBaleToVessels < ActiveRecord::Migration
  def change
    add_column :vessels, :port_of_registry, :string
    add_column :vessels, :bale, :decimal
  end
end
