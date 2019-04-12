require 'paypal-checkout-sdk'
module OrderHelper

    def environment
        client_id = ENV['PAYPAL_CLIENT_ID']
        client_secret = ENV['PAYPAL_CLIENT_SECRET']
  
        PayPal::SandboxEnvironment.new(client_id, client_secret)
    end

    def client
        PayPal::PayPalHttpClient.new(self.environment)
    end

    def openstruct_to_hash(object, hash = {})
        object.each_pair do |key, value|
          hash[key] = value.is_a?(OpenStruct) ? openstruct_to_hash(value) : value.is_a?(Array) ? array_to_hash(value) : value
        end
        hash
    end
  
      # Utility to convert array of OpenStruct to hash.
      def array_to_hash(array, hash= [])
        array.each do |item|
          x = item.is_a?(OpenStruct) ? openstruct_to_hash(item) : item.is_a?(Array) ? array_to_hash(item) : item
          hash << x
        end
        hash
      end
end
