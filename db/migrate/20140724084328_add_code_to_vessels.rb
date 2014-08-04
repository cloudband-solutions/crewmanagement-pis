class AddCodeToVessels < ActiveRecord::Migration
  def change
    add_column :vessels, :code, :string
  end
end
