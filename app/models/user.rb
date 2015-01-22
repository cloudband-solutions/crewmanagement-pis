class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  USER_TYPES = ["principal", "normal", "admin", "encoder", "manager"]

  validates :user_type, presence: true, inclusion: { in: USER_TYPES }
  validates :access_token, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  belongs_to :principal
  validates :principal, presence: true, if: :principal_user?

  before_validation :load_defaults

  def load_defaults
    if self.access_token.nil?
      self.access_token = "#{SecureRandom.hex(6)}"
    end

    self.first_name = self.first_name.upcase
    self.last_name = self.last_name.upcase
  end

  def principal_user?
    user_type == 'principal'
  end

  def baliwag_user?
    user_type != 'principal' ? true : false
  end

  def to_s
    "#{first_name} #{last_name}"
  end

end
