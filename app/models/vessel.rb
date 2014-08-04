class Vessel < ActiveRecord::Base
  has_many :crews
  belongs_to :vessel_type

  before_save :load_defaults

  validates :code, presence: true
  validates :vessel_type, presence: true

  validates :name, presence: true, uniqueness: true
  validates :flag, presence: true
  validates :owner, presence: true

  def to_s
    name
  end

  def load_defaults
    self.owner.upcase
    self.flag.upcase
  end
end
