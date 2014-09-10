class EmploymentRecord < ActiveRecord::Base
  belongs_to :crew
  belongs_to :vessel
  belongs_to :rank
  belongs_to :manning_agent
  belongs_to :reason_for_disembarkation

  #validates :crew, presence: true
  validates :vessel, presence: true
  validates :manning_agent, presence: true
  validates :rank, presence: true
  validates :sign_on, presence: true
  #validates :sign_off, presence: true
end
