# frozen_string_literal: true

module SmartPension
  module Readers
    # reads file
    class FileReader < Base
      ALLOWED_FILE_NAMES = [
        'webserver.log'
      ].freeze

      # initializes instance
      def initialize(file_path:, file_class: File, log_entry_class: LogEntry)
        @file_path = file_path
        @file_class = file_class
        @log_entry_class = log_entry_class

        validate_file_name!
      end

      private

      # returns an array of LogEntry instances
      def retrieve_entries
        result = []

        @file_class.open(@file_path, 'r').each do |line|
          page_path, ip_address = line.split(' ')
          result << @log_entry_class.new(page_path, ip_address)
        end

        result
      end

      # validates file name
      def validate_file_name!
        raise "Bad file name: #{@file_path}" unless ALLOWED_FILE_NAMES.any? { |name| @file_path.to_s.ends_with?(name) }
      end
    end
  end
end
