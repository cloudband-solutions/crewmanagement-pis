class Document < ActiveRecord::Base
  belongs_to :crew
  belongs_to :document_kind
  DOC_TYPES = %w(certificate quarantine)

  has_attached_file :attachment
  validates_attachment_content_type :attachment, content_type: %w(image/jpg image/jpeg image/png application/pdf)
  validates :attachment, presence: true

  #validates :crew, presence: true
  #validates :name, presence: true
  #validates :document_type, presence: true, inclusion: { in: DOC_TYPES }
  validates :doc_number, presence: true, uniqueness: true
  validates :issued_by, presence: true
  validates :issued_at, presence: true
  validates :expiry_date, presence: true

  def to_s
    name
  end
end
