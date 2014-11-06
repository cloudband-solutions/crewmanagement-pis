class LicenseType < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true

  has_many :transmittal_record_license_types
  has_many :transmittal_records, through: :transmittal_record_license_types

  belongs_to :license_category

  def to_s
    name
  end
end
