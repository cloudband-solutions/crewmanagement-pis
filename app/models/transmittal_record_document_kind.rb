class TransmittalRecordDocumentKind < ActiveRecord::Base
  belongs_to :transmittal_record
  belongs_to :document_kind
end
