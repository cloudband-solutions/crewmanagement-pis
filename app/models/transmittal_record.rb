class TransmittalRecord < ActiveRecord::Base

  STATUSES = ["pending", "approved", "archived"]

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

  # TODO: Proper error handling
  def approve_form!
    if self.status != "pending"
      raise "error"
    else

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
