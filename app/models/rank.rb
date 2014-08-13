class Rank < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true

  has_many :crews
  has_many :licenses

  def active_crews
    self.crews.active
  end

  def to_s
    name
  end
end
