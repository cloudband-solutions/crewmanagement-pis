class PoeaCompany < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  has_many :vessels

  def to_s
    name
  end

  def num_vessels
    self.vessels.count
  end
end
