class LicenseCategory < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true

  has_many :licenses

  has_many :license_types

  def to_s
    name
  end
end
