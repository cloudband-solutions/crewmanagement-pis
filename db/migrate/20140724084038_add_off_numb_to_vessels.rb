class AddOffNumbToVessels < ActiveRecord::Migration
  def change
    add_column :vessels, :off_numb, :string
  end
end
