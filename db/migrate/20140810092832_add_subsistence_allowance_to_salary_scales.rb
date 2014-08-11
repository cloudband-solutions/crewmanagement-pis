class AddSubsistenceAllowanceToSalaryScales < ActiveRecord::Migration
  def change
    add_column :salary_scales, :subsistence_allowance, :decimal
  end
end
