class EducationalAttainment < ActiveRecord::Base
  validates :year_graduated, presence: true
  validates :school, presence: true
  validates :course_finished, presence: true

  def to_s
    "#{year_graduated} - #{school} - #{course_finished}"
  end
end
