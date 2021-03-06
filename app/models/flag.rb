class Flag < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true

  has_many :vessels
  has_many :certificates

  def to_s
    name
  end

  def num_vessels
    self.vessels.count
  end
end
