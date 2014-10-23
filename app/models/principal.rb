class Principal < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :telephone_number, presence: true, uniqueness: true

  has_many :principal_contact_people
  accepts_nested_attributes_for :principal_contact_people

  has_many :vessels

  def to_s
    name
  end

  def num_contact_people
    self.principal_contact_people.count
  end

  def num_vessels
    self.vessels.count
  end

  def crews
    data = []
    self.vessels.each do |v|
      Crew.all_by_vessel(v).each do |c|
        data << c
      end
    end
    return data
  end
end
