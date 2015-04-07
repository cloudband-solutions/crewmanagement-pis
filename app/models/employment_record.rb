class EmploymentRecord < ActiveRecord::Base
  belongs_to :crew
  belongs_to :vessel
  belongs_to :rank
  belongs_to :manning_agent
  belongs_to :reason_for_disembarkation
  belongs_to :principal
  belongs_to :transmittal_record

  #validates :crew, presence: true
  #validates :vessel, presence: true
  validates :manning_agent, presence: true
  validates :rank, presence: true
  validates :sign_on, presence: true
  #validates :sign_off, presence: true

  before_save :load_defaults

  def load_defaults
    if !self.other_vessel.blank?
      v = Vessel.new(name: self.other_vessel.upcase, code: self.other_vessel.upcase)
      if v.save
        self.vessel_id = v.id
        self.other_vessel = nil
      else
        self.errors.add(:other_vessel, "Name already taken")
        return false
      end
    end
  end
end
