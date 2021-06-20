# frozen_string_literal: true

require_relative 'base'
require_relative '../entities/log_entry'
require_relative '../validators/file_reader'

module LogParser
  module Readers
    # reads file
    class FileReader < Base
      # initializes instance
      def initialize(
        file_path:,
        file_class: File,
        log_entry_class: LogParser::Entities::LogEntry
      )
        @file_path = file_path
        @file_class = file_class
        @log_entry_class = log_entry_class
      end

      private

      def retrieve_entries
        result = []

        @file_class.foreach(@file_path) do |line|
          page_path, ip_address = line.split(' ')
          result << @log_entry_class.new(page_path, ip_address)
        end

        result
      end
    end
  end
end
