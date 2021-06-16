# frozen_string_literal: true

require_relative 'base'
require_relative 'ip_address'
require_relative 'page_path'

module SmartPension
  module Validators
    # entry validator
    class Entry < Base
      VALIDATORS = [
        IpAddress,
        PagePath
      ].freeze

      # returns true if each validator returns true
      def self.valid?(item = nil)
        VALIDATORS.all? { |validator| validator.valid?(item) }
      end
    end
  end
end
