class TransmittalRecord < ActiveRecord::Base

  STATUSES = ["pending", "on-transit", "approved", "archived"]

  validates :transmittal_code, presence: true, uniqueness: true
  validates :prepared_by, presence: true
  validates :prepared_by_position, presence: true
  validates :approved_by, presence: true
  validates :approved_by_position, presence: true
  validates :noted_by, presence: true
  validates :noted_by_position, presence: true
  validates :date_of_departure, presence: true
  validates :destination, presence: true
  validates :status, presence: true, inclusion: { in: TransmittalRecord::STATUSES }

  belongs_to :vessel
  validates :vessel, presence: true

  has_many :transmittal_record_embarking_crews
  accepts_nested_attributes_for :transmittal_record_embarking_crews, allow_destroy: true

  has_many :transmittal_record_disembarking_crews
  accepts_nested_attributes_for :transmittal_record_disembarking_crews, allow_destroy: true

  has_many :transmittal_record_crew_promotions
  accepts_nested_attributes_for :transmittal_record_crew_promotions, allow_destroy: true

  has_many :transmittal_record_license_types
  has_many :license_types, through: :transmittal_record_license_types

  before_validation :load_defaults

  def transit!
    if self.status != "pending"
      raise "error in transit!"
    else
      self.status = "on-transit"
      self.save!
    end
  end

  # TODO: Proper error handling
  def approve!
    if self.status != "on-transit"
      raise "error in approve!"
    else
      # Update employment history of disembarking crew
      self.transmittal_record_disembarking_crews.each do |trdc|
        employment_record = EmploymentRecord.new  
        employment_record.crew_id = trdc.crew.id
        employment_record.vessel_id = self.vessel.id
        employment_record.rank_id = trdc.crew.rank.id
        employment_record.manning_agent_id = trdc.manning_agent.id
        employment_record.sign_on = trdc.date_embarked
        employment_record.sign_off = trdc.sign_off
        employment_record.reason_for_disembarkation_id = trdc.reason_for_disembarkation.id
        employment_record.save!
      end

      self.status = "approved"
      self.save!
    end
  end

  def load_defaults
    if self.new_record?
      self.transmittal_code = SecureRandom.uuid
      self.status = "pending"
    end
  end

  def archive!
    self.status = "archived"
    self.save!
  end

  def to_s
    transmittal_code
  end
end
