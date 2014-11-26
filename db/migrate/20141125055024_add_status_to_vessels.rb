class AddStatusToVessels < ActiveRecord::Migration
  def change
    add_column :vessels, :status, :string
  end
end
