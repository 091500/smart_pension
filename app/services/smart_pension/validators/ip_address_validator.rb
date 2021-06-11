module SmartPension
  module Validators
    class IpAddressValidator < BaseValidator
      def self.valid?(item)
        item&.respond_to?(:ip_address)
      end
    end
  end
end
