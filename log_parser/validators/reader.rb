# frozen_string_literal: true

require_relative 'base'
require_relative 'file_reader'
require_relative '../readers/file_reader'

module LogParser
  module Validators
    # entry validator
    class Reader < Base
      # returns true if each validator returns true
      def self.valid?(
        reader,
        path,
        file_reader_validator_class: FileReader,
        file_reader_class: LogParser::Readers::FileReader
      )
        return file_reader_validator_class.valid?(path) if reader.is_a?(file_reader_class)

        false
      end
    end
  end
end
