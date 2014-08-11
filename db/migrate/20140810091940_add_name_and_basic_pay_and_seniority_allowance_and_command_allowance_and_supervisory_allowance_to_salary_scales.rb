class AddNameAndBasicPayAndSeniorityAllowanceAndCommandAllowanceAndSupervisoryAllowanceToSalaryScales < ActiveRecord::Migration
  def change
    add_column :salary_scales, :name, :string
    add_column :salary_scales, :basic_pay, :decimal
    add_column :salary_scales, :seniority_allowance, :decimal
    add_column :salary_scales, :command_allowance, :decimal
    add_column :salary_scales, :supervisory_allowance, :decimal
  end
end
