class TransmittalRecordEmbarkingCrew < ActiveRecord::Base
  belongs_to :transmittal_record

  belongs_to :crew
  validates :crew, presence: true, uniqueness: { scope: :transmittal_record_id }

  belongs_to :rank
  validates :rank, presence: true

  belongs_to :manning_agent
  validates :manning_agent, presence: true

  before_validation :load_defaults

  def load_defaults
    self.rank_id = self.crew.rank.id
  end
end
