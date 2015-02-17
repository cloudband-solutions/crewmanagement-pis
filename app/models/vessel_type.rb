class VesselType < ActiveRecord::Base
  has_many :vessels

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end

  def vessel_count_by_principal(principal_id)
    Vessel.where(vessel_type_id: self.id, principal_id: principal_id).count
  end
end
