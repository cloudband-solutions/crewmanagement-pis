# Model representing "vessels" table
class Vessel < ActiveRecord::Base
  # One to Many association. 1 Vessel has many Crews
  has_many :crews
end
