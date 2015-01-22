class DocumentKind < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true

  has_many :transmittal_record_document_kinds
  has_many :transmittal_records, through: :transmittal_record_document_kinds
  def to_s
    name
  end
end
