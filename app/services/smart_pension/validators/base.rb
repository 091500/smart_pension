# frozen_string_literal: true

module SmartPension
  module Validators
    # base reader
    class Base
      # must be overridden
      def self.valid?(_item)
        raise 'Not implemented'
      end
    end
  end
end
