class TransmittalRecordLicenseType < ActiveRecord::Base
  belongs_to :transmittal_record
  belongs_to :license_type
end
