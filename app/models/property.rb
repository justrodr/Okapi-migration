class Property < ActiveRecord::Base
    # validates(:user, presence: true)
    # validates(:prop_name, presence: true)
    validates(:tenant_name, presence: true)
    validates(:tenant_email, presence: true)
    validates(:address, presence: true)
    # validates(:frequency, presence: true)
end