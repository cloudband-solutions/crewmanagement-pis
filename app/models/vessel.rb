class Vessel < ActiveRecord::Base
  has_many :crews

  VESSEL_TYPE = ["A", "B", "C"]

  def to_s
    name
  end
end
