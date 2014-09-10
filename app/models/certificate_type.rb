class CertificateType < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
  has_many :certificates

  def to_s
    name
  end
end
