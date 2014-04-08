# Mode representing "crews" table
class Crew < ActiveRecord::Base
  # Many to One association. Crew belongs to a vessel
  belongs_to :vessel

  def to_s
    "#{firstname} #{lastname}"
  end
end
