class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]
     before_save { email.downcase! }
     #validates(:first_name, presence: true)
     #validates(:last_name, presence: true)
     #validates :email, presence: true, uniqueness: { case_sensitive: false }
     #validates :password, presence: true, length: { minimum: 6 }
     #has_secure_password
     def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.provider = auth.provider
        user.uid = auth.uid
        user.password = Devise.friendly_token[0,20]
      end
    end
end
