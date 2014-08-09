class Flag < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true

  has_many :vessels

  def to_s
    code
  end

  def num_vessels
    self.vessels.count
  end
end
