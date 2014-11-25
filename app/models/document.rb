class Document < ActiveRecord::Base
  belongs_to :crew
  belongs_to :document_kind
  validates :document_kind, presence: true
  DOC_TYPES = %w(certificate quarantine)

  has_attached_file :attachment
  validates_attachment_content_type :attachment, content_type: %w(image/jpg image/jpeg image/png application/pdf), if: :not_reverting?
  validates :attachment, presence: true, if: :not_reverting?

  #validates :crew, presence: true
  #validates :name, presence: true
  #validates :document_type, presence: true, inclusion: { in: DOC_TYPES }
  validates :doc_number, presence: true, uniqueness: true, if: :not_reverting?
  validates :issued_by, presence: true, if: :not_reverting?
  validates :issued_at, presence: true, if: :not_reverting?
  validates :expiry_date, presence: true, if: :not_reverting?

  def to_s
    name
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
