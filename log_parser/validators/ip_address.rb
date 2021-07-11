# frozen_string_literal: true

require_relative 'base'

module LogParser
  module Validators
    # ip address validator
    class IpAddress < Base
      # validates ip address
      def self.valid?(ip = nil)
        return false unless ip

        ip.match?(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/)
      end
    end
  end
end
