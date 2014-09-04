class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  USER_TYPES = ["principal", "normal", "admin", "encoder", "manager"]

  validates :user_type, presence: true, inclusion: { in: USER_TYPES }

  def baliwag_user?
    user_type != 'principal' ? true : false
  end

end
