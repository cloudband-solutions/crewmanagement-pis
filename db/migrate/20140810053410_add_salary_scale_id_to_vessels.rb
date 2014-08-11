class AddSalaryScaleIdToVessels < ActiveRecord::Migration
  def change
    add_column :vessels, :salary_scale_id, :integer
  end
end
