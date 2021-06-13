module SmartPension
  module Validators
    class IpAddressValidator < BaseValidator
      def self.valid?(item)
        return false unless item
        return false unless item.respond_to?(:ip_address)

        ip_address = item.ip_address
        ip_address.present? && ip_address.match?(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/)
      end
    end
  end
end
