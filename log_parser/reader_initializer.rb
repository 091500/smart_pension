# frozen_string_literal: true

require_relative 'readers/file_reader'

module LogParser
  # initializes reader according to the input_string
  class ReaderInitializer
    def initialize(input_string, file_reader_class: Readers::FileReader)
      @file_reader_class = file_reader_class
      @reader = @file_reader_class.new(file_path: input_string)
    end

    # yields valid entries
    def each
      reader.valid_entries.each { |entry| yield entry }
    end

    attr_reader :reader

    private

    attr_reader :file_reader_class
  end
end
