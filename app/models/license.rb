class License < ActiveRecord::Base
  belongs_to :crew

  belongs_to :license_type
  validates :license_type, presence: true
  
  has_attached_file :attachment
  validates_attachment_content_type :attachment, content_type: %w(image/jpg image/jpeg image/png application/pdf)
  validates :attachment, presence: true

  #validates :crew, presence: true
  #validates :country, presence: true
  #validates :kind, presence: true
  validates :license_number, presence: true, uniqueness: true
  validates :date_issued, presence: true
  validates :expiry_date, presence: true
  validates :issued_by, presence: true

  def to_s
    "#{license_number}"
  end
end
