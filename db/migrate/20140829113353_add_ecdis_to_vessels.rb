class AddEcdisToVessels < ActiveRecord::Migration
  def change
    add_column :vessels, :ecdis, :string
  end
end
