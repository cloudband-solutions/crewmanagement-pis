class Rank < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true

  has_many :crews
  has_many :licenses

  def active_crews
    self.crews.active
  end

  def to_s
    name
  end

  def crew_count_by_principal(principal_id)
    #Crew.joins(:vessel).joins(:principal).where("crews.rank_id = ? AND principals.id = ?", self.id, principal_id).count
    Crew.includes(:vessel => {principal_id: principal_id}).where(rank_id: self.id).count
    
  end
end
