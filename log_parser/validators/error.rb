# frozen_string_literal: true

require_relative 'base'
require_relative 'reader'

module LogParser
  module Validators
    # error validator
    class Error
      def initialize(path = nil, reader = nil, reader_validator_class: Validators::Reader)
        @path = path
        @reader = reader
        @reader_validator_class = reader_validator_class
      end

      def validate
        errors = []
        errors << 'Missing file path' unless @path
        errors << 'Reader is not supported' unless @reader
        errors << 'File Reader failed' unless @reader_validator_class.valid?(@reader.reader, @path) if @reader

        errors
      end

    end
  end
end
