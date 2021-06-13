module SmartPension
  module Validators
    class Entry < Base
      VALIDATORS = [
        IpAddress,
        PagePath
      ].freeze

      def self.valid?(item = nil)
        VALIDATORS.all? { |validator| validator.valid?(item) }
      end
    end
  end
end
