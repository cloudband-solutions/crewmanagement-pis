class AddGuaranteedOvertimeAndFixedOvertimeAndLeavePayAndGoodPerformanceBonusToSalaryScales < ActiveRecord::Migration
  def change
    add_column :salary_scales, :guaranteed_overtime, :decimal
    add_column :salary_scales, :fixed_overtime, :decimal
    add_column :salary_scales, :leave_pay, :decimal
    add_column :salary_scales, :good_performance_bonus, :decimal
  end
end
