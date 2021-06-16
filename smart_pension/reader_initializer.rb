# frozen_string_literal: true

require_relative 'readers/file_reader'

module SmartPension
  # initializes reader according to the input_string
  class ReaderInitializer
    def initialize(input_string, file_reader_class: Readers::FileReader)
      @input_string = input_string
      @file_reader_class = file_reader_class

      @reader = init_reader
    end

    # yields valid entries
    def each
      raise "Reader is not supported for #{@input_string}" unless @reader

      @reader.valid_entries.each { |entry| yield entry }
    end

    private

    # initializes reader instance
    def init_reader
      return @file_reader_class.new(file_path: @input_string) if @input_string =~ /\.log$/

      false
    end
  end
end
