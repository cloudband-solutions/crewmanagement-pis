class ModifySalaryScales < ActiveRecord::Migration
  def change
    remove_column :salary_scales, :maxiumum
    add_column :salary_scales, :maximum, :decimal
  end
end
