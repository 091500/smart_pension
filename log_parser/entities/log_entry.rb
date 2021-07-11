# frozen_string_literal: true

require_relative '../validators/ip_address'
require_relative '../validators/page_path'

module LogParser
  module Entities
    # represents a log entry line
    class LogEntry
      # initializes instance
      def initialize(
        page_path = nil,
        ip_address = nil,
        validators: { page_path: Validators::PagePath, ip_address: Validators::IpAddress }
      )
        @page_path = page_path
        @ip_address = ip_address
        @validators = validators
      end

      # returns true if valid
      def valid?
        return false unless validators[:page_path]
        return false unless validators[:ip_address]

        validators[:page_path].valid?(page) && validators[:ip_address].valid?(ip)
      end

      def page
        page_path
      end

      def ip
        ip_address
      end

      private

      attr_reader :page_path, :ip_address, :validators
    end
  end
end
