class CrewVesselEvaluation < ActiveRecord::Base
  belongs_to :crew
  belongs_to :vessel

  validates :date_of_evaluation, presence: true

  has_attached_file :attachment
  validates_attachment_content_type :attachment, content_type: %w(image/jpg image/jpeg image/png application/pdf)
  validates :attachment, presence: true

  has_attached_file :recommendation_letter
  validates_attachment_content_type :recommendation_letter, content_type: %w(image/jpg image/jpeg image/png application/pdf)
  validates :recommendation_letter, presence: true

  has_attached_file :training_record
  validates_attachment_content_type :training_record, content_type: %w(image/jpg image/jpeg image/png application/pdf)
  validates :training_record, presence: true
end
