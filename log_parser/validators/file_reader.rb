# frozen_string_literal: true

require_relative 'base'

module LogParser
  module Validators
    # entry validator
    class FileReader < Base
      def self.valid?(path = nil)
        return false unless path

        File.file?(path)
      end
    end
  end
end
