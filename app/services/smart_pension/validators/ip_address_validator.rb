module SmartPension
  module Validators
    class IpAddressValidator < BaseValidator
      def self.valid?(item)
        return false unless item
        return false unless item.respond_to?(:ip_address)

        item.ip_address.present?
      end
    end
  end
end
