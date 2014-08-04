class VesselType < ActiveRecord::Base
  has_many :vessels

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
