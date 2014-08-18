class TransmittalRecordDisembarkingCrew < ActiveRecord::Base
  belongs_to :crew
  validates :crew, presence: true

  belongs_to :transmittal_record

  belongs_to :rank
  validates :rank, presence: true

  validates :date_embarked, presence: true

  belongs_to :reason_for_disembarkation
  validates :reason_for_disembarkation, presence: true

  belongs_to :manning_agent
  validates :manning_agent, presence: true

  validates :sign_off, presence: true

  before_validation :load_defaults

  def load_defaults
    self.rank_id = self.crew.rank.id
  end
end
