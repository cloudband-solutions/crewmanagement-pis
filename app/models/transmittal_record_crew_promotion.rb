class TransmittalRecordCrewPromotion < ActiveRecord::Base
  belongs_to :transmittal_record

  belongs_to :crew
  validates :crew, presence: true, uniqueness: { scope: :transmittal_record_id }

  belongs_to :to_rank, class_name: "Rank"
  validates :to_rank, presence: true

  belongs_to :from_rank, class_name: "Rank"
  validates :from_rank, presence: true

  before_validation :load_defaults

  def load_defaults
    self.from_rank = self.crew.rank
  end

  def to_s
    "#{crew} - #{from_rank} to #{to_rank}"
  end
end
