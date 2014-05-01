class EmploymentRecord < ActiveRecord::Base
  belongs_to :crew
  belongs_to :vessel

  validates :crew, presence: true
  validates :vessel, presence: true
  validates :manning_agent, presence: true
  validates :rank, presence: true
  validates :sign_on, presence: true
  validates :sign_off, presence: true
  validates :reason_of_disembarkation, presence: true
end
