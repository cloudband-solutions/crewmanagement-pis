class TransmittalRecord < ActiveRecord::Base

  STATUSES = ["pending", "approved", "archived"]

  validate :crew_uniqueness, on: :create

  validates :transmittal_code, presence: true, uniqueness: true
  #validates :prepared_by, presence: true
  #validates :prepared_by_position, presence: true
  #validates :approved_by, presence: true
  #validates :approved_by_position, presence: true
  #validates :noted_by, presence: true
  #validates :noted_by_position, presence: true
  validates :date_of_departure, presence: true
  validates :destination, presence: true
  validates :status, presence: true, inclusion: { in: TransmittalRecord::STATUSES }

  belongs_to :vessel
  validates :vessel, presence: true

  has_many :transmittal_record_embarking_crews
  accepts_nested_attributes_for :transmittal_record_embarking_crews, allow_destroy: true
  validates_associated :transmittal_record_embarking_crews

  has_many :transmittal_record_disembarking_crews
  accepts_nested_attributes_for :transmittal_record_disembarking_crews, allow_destroy: true
  validates_associated :transmittal_record_disembarking_crews

  has_many :transmittal_record_crew_promotions
  accepts_nested_attributes_for :transmittal_record_crew_promotions, allow_destroy: true
  validates_associated :transmittal_record_crew_promotions

  has_many :transmittal_record_license_types
  has_many :license_types, through: :transmittal_record_license_types

  has_many :transmittal_record_document_kinds
  has_many :document_kinds, through: :transmittal_record_document_kinds

  has_many :employment_records

  before_validation :load_defaults

  def crew_uniqueness
    if self.transmittal_record_embarking_crews.map(&:crew_id).count != self.transmittal_record_embarking_crews.map(&:crew_id).uniq.count
      errors.add(:base, "Duplicate crew detected")
    end

    if self.transmittal_record_disembarking_crews.map(&:crew_id).count != self.transmittal_record_disembarking_crews.map(&:crew_id).uniq.count
      errors.add(:base, "Duplicate crew detected")
    end

    if self.transmittal_record_crew_promotions.map(&:crew_id).count != self.transmittal_record_crew_promotions.map(&:crew_id).uniq.count
      errors.add(:base, "Duplicate crew detected")
    end
  end

  # TODO: Proper error handling
  def approve!
    if self.status != "pending"
      raise "error in approve!"
    else
      # Create employment history of embarking crew
      self.transmittal_record_embarking_crews.each do |trec|
        employment_record = EmploymentRecord.new  
        employment_record.crew_id = trec.crew.id
        employment_record.vessel_id = self.vessel.id
        employment_record.rank_id = trec.crew.rank.id
        employment_record.manning_agent_id = trec.crew.manning_agent.id
        employment_record.sign_on = self.date_of_departure

        # Add transmittal record
        employment_record.transmittal_record_id = self.id
        employment_record.save!

        # inactivate this crew
        trec.crew.update!(vessel: nil, sign_on: trec.date_embarked, date_of_promotion: nil)
      end

      # Update employment history of disembarking crew
      self.transmittal_record_disembarking_crews.each do |trdc|
        employment_record = EmploymentRecord.new 

        if trdc.crew.employment_records.where(transmittal_record_id: self.id).count > 0
          employment_record = trdc.crew.employment_records.where(transmittal_record_id: self.id).first
        end

        employment_record.crew_id = trdc.crew.id
        employment_record.vessel_id = self.vessel.id
        employment_record.rank_id = trdc.crew.rank.id
        employment_record.manning_agent_id = trdc.crew.manning_agent.id
        employment_record.sign_on = trdc.date_embarked
        employment_record.sign_off = trdc.sign_off
        employment_record.reason_for_disembarkation_id = trdc.reason_for_disembarkation.id
        employment_record.save!

        # inactivate this crew
        trdc.crew.update!(vessel: nil, sign_on: trdc.date_embarked, date_of_promotion: nil)
      end

      self.transmittal_record_embarking_crews.each do |trec|
        # activate this crew
        trec.crew.update!(vessel: vessel)
      end

      self.transmittal_record_crew_promotions.each do |trcp|
        # promote this crew
        trcp.crew.update!(rank: trcp.to_rank, date_of_promotion: Time.now)
      end

      self.update!(status: "approved")
    end
  end

  def load_defaults
    if self.new_record?
      self.transmittal_code = SecureRandom.uuid
      self.status = "pending"
    end
    self.destination = self.destination.upcase
  end

  def archive!
    self.update!(status: "archived")
  end

  def to_s
    transmittal_code
  end
end
