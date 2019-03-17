class User < ActiveRecord::Base
     before_save { email.downcase! }
     validates(:first_name, presence: true)
     validates(:last_name, presence: true)
     validates :email, presence: true, uniqueness: { case_sensitive: false }
     validates :password, presence: true, length: { minimum: 7 }
     has_secure_password
end
