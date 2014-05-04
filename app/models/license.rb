class License < ActiveRecord::Base
  belongs_to :crew
  
  has_attached_file :attachment
  validates_attachment_content_type :attachment, content_type: %w(image/jpg image/jpeg image/png)
  validates :attachment, presence: true

  #validates :crew, presence: true
  validates :country, presence: true
  validates :kind, presence: true
  validates :license_number, presence: true, uniqueness: true
  validates :date_issued, presence: true
  validates :expiry_date, presence: true
  validates :issued_by, presence: true

  def to_s
    "#{license_number}"
  end
end
