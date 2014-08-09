class Vessel < ActiveRecord::Base
  has_many :crews
  belongs_to :vessel_type
  belongs_to :principal
  belongs_to :poea_company
  belongs_to :flag

  before_save :load_defaults

  validates :code, presence: true
  validates :vessel_type, presence: true

  validates :name, presence: true, uniqueness: true
  validates :owner, presence: true

  def to_s
    name
  end

  def load_defaults
    self.owner.upcase
  end
end
