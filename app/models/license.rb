class License < ActiveRecord::Base
  belongs_to :crew

  belongs_to :license_type
  validates :license_type, presence: true

  belongs_to :rank

  belongs_to :license_category
  validates :license_category, presence: true

  belongs_to :training_center
  
  has_attached_file :attachment
  validates_attachment_content_type :attachment, content_type: %w(image/jpg image/jpeg image/png application/pdf), if: :not_reverting?
  validates :attachment, presence: true, if: :not_reverting?

  #validates :crew, presence: true
  #validates :country, presence: true
  #validates :kind, presence: true
  validates :license_number, presence: true, uniqueness: true, if: :not_reverting?
  validates :date_issued, presence: true, if: :not_reverting?
  #validates :expiry_date, presence: true

  def to_s
    "#{license_number}"
  end

  def reverting?
    is_reverting
  end

  def not_reverting?
    if is_reverting == true
      false
    else
      true
    end
  end
end
