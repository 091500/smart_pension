# frozen_string_literal: true

require_relative '../validators/entry'

module LogParser
  module Entities
    # represents a log entry line
    class LogEntry
      attr_reader :page_path, :ip_address

      # initializes instance
      def initialize(page_path = nil, ip_address = nil, validator: Validators::Entry)
        @page_path = page_path
        @ip_address = ip_address
        @validator = validator
      end

      # returns true if valid
      def valid?
        @validator.valid?(self)
      end
    end
  end
end
