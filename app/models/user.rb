class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  USER_TYPES = ["principal", "normal", "admin", "encoder"]

  validates :user_type, presence: true, inclusion: { in: USER_TYPES }

end
