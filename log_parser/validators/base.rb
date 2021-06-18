# frozen_string_literal: true

module LogParser
  module Validators
    # base reader
    class Base
      # must be overridden
      def self.valid?(item)
        raise 'Not implemented'
      end
    end
  end
end
