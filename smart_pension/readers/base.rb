# frozen_string_literal: true

module SmartPension
  module Readers
    # base reader
    class Base
      # returns array of entries
      def entries
        @entries ||= retrieve_entries
      end

      # returns array of valid entries
      def valid_entries
        entries.select(&:valid?)
      end

      private

      # retrieves entries
      def retrieve_entries
        []
      end
    end
  end
end
