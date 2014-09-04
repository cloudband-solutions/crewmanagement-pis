class Vessel < ActiveRecord::Base
  LIFEBOAT_TYPES = ["davit", "freefall"]
  has_many :crews

  belongs_to :vessel_type
  belongs_to :principal
  belongs_to :poea_company
  belongs_to :flag
  belongs_to :salary_scale
  belongs_to :classification_society

  before_save :load_defaults

  validates :code, presence: true
  validates :vessel_type, presence: true 
  validates :name, presence: true, uniqueness: true
  validates :owner, presence: true

  validates :email, presence: true, uniqueness: true
  validates :inmarsat_id_number, presence: true, uniqueness: true
  validates :tel_number, presence: true, uniqueness: true
  validates :fax_number, presence: true, uniqueness: true
  validates :imo_number, presence: true, uniqueness: true
  validates :callsign, presence: true, uniqueness: true
  validates :grt, presence: true, numericality: true
  validates :nrt, presence: true, numericality: true
  validates :dwt, presence: true, numericality: true
  validates :loa, presence: true, numericality: true
  validates :breadth, presence: true, numericality: true
  validates :depth, presence: true, numericality: true
  validates :engine_model, presence: true

  before_validation :load_defaults

  def active_crews
    self.crews.active
  end

  def to_s
    name
  end

  def load_defaults
    if !self.name.nil?
      self.name = self.name.upcase
    end

    if !self.code.nil?
      self.code = self.code.upcase
    end
  end
end
