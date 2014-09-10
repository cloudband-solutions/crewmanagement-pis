class Certificate < ActiveRecord::Base
  belongs_to :crew

  validates :certificate_number, presence: true, uniqueness: true
  
  belongs_to :certificate_type
  validates :certificate_type, presence: true

  belongs_to :certificate_category
  validates :certificate_category, presence: true

  validates :date_issued, presence: true
  validates :expiry_date, presence: true

  belongs_to :flag

  has_attached_file :attachment
  validates_attachment_content_type :attachment, content_type: %w(image/jpg image/jpeg image/png application/pdf)

  def to_s
    certificate_number
  end
end
