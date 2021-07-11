# frozen_string_literal: true

module LogParser
  module Presenters
    # presents page views
    class Result
      def initialize
        @data_lines = []
      end

      # returns formatted data
      def show
        data_lines.join("\n")
      end

      def <<(data_line)
        data_lines << data_line
      end

      private

      attr_reader :data_lines
    end
  end
end
