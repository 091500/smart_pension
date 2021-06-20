# frozen_string_literal: true

require_relative 'readers/file_reader'

module LogParser
  # initializes reader according to the input_string
  class ReaderInitializer
    attr_reader :reader

    def initialize(input_string, file_reader_class: Readers::FileReader)
      @input_string = input_string
      @file_reader_class = file_reader_class

      init_reader
    end

    # yields valid entries
    def each
      @reader.valid_entries.each { |entry| yield entry }
    end

    # initializes reader instance
    def init_reader
      @reader = @file_reader_class.new(file_path: @input_string)
    end
  end
end
