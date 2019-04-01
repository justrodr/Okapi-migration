class Property < ActiveRecord::Base
    validates(:tenant_name, presence: true)
    validates(:tenant_email, presence: true)
    validates(:address, presence: true)
end