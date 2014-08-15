class TransmittalRecordCrewPromotion < ActiveRecord::Base
  belongs_to :transmittal_record

  belongs_to :crew
  validates :crew, presence: true

  belongs_to :to_rank, class_name: "Rank"
  validates :to_rank, presence: true

  belongs_to :from_rank, class_name: "Rank"
  validates :from_rank, presence: true

  def to_s
    "#{crew} - #{from_rank} to #{to_rank}"
  end
end
