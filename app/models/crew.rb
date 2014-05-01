# Mode representing "crews" table
class Crew < ActiveRecord::Base
  # Many to One association. Crew belongs to a vessel
  belongs_to :vessel

  has_many :employment_records
  accepts_nested_attributes_for :employment_records

  def to_s
    "#{firstname} #{lastname}"
  end
end
