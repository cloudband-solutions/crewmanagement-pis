class SalaryScale < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :basic_pay, presence: true, numericality: true
  validates :seniority_allowance, presence: true, numericality: true
  validates :command_allowance, presence: true, numericality: true
  validates :supervisory_allowance, presence: true, numericality: true
  validates :guaranteed_overtime, presence: true, numericality: true
  validates :fixed_overtime, presence: true, numericality: true
  validates :leave_pay, presence: true, numericality: true
  validates :good_performance_bonus, presence: true, numericality: true
  validates :subsistence_allowance, presence: true, numericality: true

  def to_s
    name
  end
end
