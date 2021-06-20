# frozen_string_literal: true

module LogParser
  module Entities
    # represents a result entry
    class ResultEntry
      attr_reader :data
      alias uniq_pages data

      # initializes instance
      def initialize
        @data = {}
      end

      # collects valid entries
      def <<(log_entry)
        return unless log_entry.respond_to?(:valid?)
        return unless log_entry.valid?

        @data[log_entry.page_path] ||= []
        @data[log_entry.page_path] << log_entry.ip_address
      end

      # Returns unique views data
      def uniq_views
        @data.each_with_object({}) { |(name, addresses), hash| hash[name] = addresses.uniq }
      end
    end
  end
end
