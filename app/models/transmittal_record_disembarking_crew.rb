class TransmittalRecordDisembarkingCrew < ActiveRecord::Base

  belongs_to :transmittal_record

  belongs_to :crew
  validates :crew, presence: true, uniqueness: { scope: :transmittal_record_id }

  belongs_to :rank
  validates :rank, presence: true

  validates :date_embarked, presence: true

  belongs_to :reason_for_disembarkation
  validates :reason_for_disembarkation, presence: true

  #belongs_to :manning_agent
  #validates :manning_agent, presence: true

  before_validation :load_defaults

  private

  def load_defaults
    if self.new_record?
      self.rank = self.crew.rank
      self.date_embarked = self.crew.sign_on
    end
  end
end
