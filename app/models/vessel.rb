# Model representing "vessels" table
class Vessel < ActiveRecord::Base
  # One to Many association. 1 Vessel has many Crews
  has_many :crews

  VESSEL_TYPE = ["A", "B", "C"]

  def to_s
    name
  end
end
