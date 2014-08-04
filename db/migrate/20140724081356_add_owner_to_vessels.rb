class AddOwnerToVessels < ActiveRecord::Migration
  def change
    add_column :vessels, :owner, :string
  end
end
