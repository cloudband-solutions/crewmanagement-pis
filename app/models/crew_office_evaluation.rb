class CrewOfficeEvaluation < ActiveRecord::Base
  belongs_to :crew
  belongs_to :vessel
  
  validates :date_of_evaluation, presence: true

  has_attached_file :attachment
  validates_attachment_content_type :attachment, content_type: %w(image/jpg image/jpeg image/png application/pdf)
  validates :attachment, presence: true
end
