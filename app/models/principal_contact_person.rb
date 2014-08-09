class PrincipalContactPerson < ActiveRecord::Base
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :contact_number, presence: true, uniqueness: true
  validates :designation, presence: true

  belongs_to :principal
  #validates :principal, presence: true

  def to_s
    "#{first_name} #{last_nmae}"
  end
end
