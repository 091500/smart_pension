# frozen_string_literal: true

require_relative 'base'
require_relative 'ip_address'
require_relative 'page_path'

module LogParser
  module Validators
    # entry validator
    class Entry < Base
      # returns true if each validator returns true
      def self.valid?(item = nil, page_path_validator = PagePath, ip_address_validator = IpAddress)
        [page_path_validator, ip_address_validator].all? { |validator| validator.valid?(item) }
      end
    end
  end
end
