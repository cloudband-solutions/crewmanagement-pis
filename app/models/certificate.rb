class Certificate < ActiveRecord::Base
  belongs_to :crew

  validates :certificate_number, presence: true, uniqueness: true, if: :not_reverting?
  
  belongs_to :certificate_type
  validates :certificate_type, presence: true, if: :not_reverting?

  belongs_to :certificate_category
  validates :certificate_category, presence: true, if: :not_reverting?

  validates :date_issued, presence: true, if: :not_reverting?
  #validates :expiry_date, presence: true

  belongs_to :flag

  has_attached_file :attachment
  validates_attachment_content_type :attachment, content_type: %w(image/jpg image/jpeg image/png application/pdf)

  def to_s
    certificate_number
  end

  def reverting?
    is_reverting
  end

  def certificate_expiry
    if !expiry_date.nil?
      time = expiry_date - 12.months
      if Time.now > time
        "#ff3232"
      end
    end
  end

  def not_reverting?
    if is_reverting == true
      false
    else
      true
    end
  end
end
