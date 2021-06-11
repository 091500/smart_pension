module SmartPension
  module Validators
    class EntryValidator < BaseValidator
      VALIDATORS = [
        IpAddressValidator,
        PagePathValidator
      ].freeze

      def valid?(item)
        VALIDATORS.all? { |validator| validator.valid?(item) }
      end
    end
  end
end
