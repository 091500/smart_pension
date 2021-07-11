# frozen_string_literal: true

module LogParser
  module Entities
    # represents a result entry
    class ResultEntry
      # initializes instance
      def initialize
        @entry_data = {}
      end

      def uniq_pages
        entry_data
      end

      # collects valid entries
      def <<(log_entry)
        return unless log_entry.respond_to?(:valid?)
        return unless log_entry.valid?

        entry_data[log_entry.page] ||= []
        entry_data[log_entry.page] << log_entry.ip
      end

      # Returns unique views data
      def uniq_views
        entry_data.each_with_object({}) { |(name, addresses), hash| hash[name] = addresses.uniq }
      end

      private

      attr_reader :entry_data
    end
  end
end
