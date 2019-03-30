class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
     before_save { email.downcase! }
     validates(:first_name, presence: true)
     validates(:last_name, presence: true)
     #validates :email, presence: true, uniqueness: { case_sensitive: false }
     #validates :password, presence: true, length: { minimum: 6 }
     #has_secure_password
end
