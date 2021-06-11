module SmartPension
  module Validators
    class BaseValidator
      def self.valid?(_item)
        raise 'Not implemented'
      end
    end
  end
end
