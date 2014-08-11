class ModifySalaryScale < ActiveRecord::Migration
  def change
    remove_column :salary_scales, :minimum
    remove_column :salary_scales, :maximum
  end
end
