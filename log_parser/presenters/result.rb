# frozen_string_literal: true

require_relative 'base'

module LogParser
  module Presenters
    # presents page views
    class Result
      def initialize
        @data_lines = []
      end

      # returns formatted data
      def show
        @data_lines.join("\n")
      end

      def <<(data_line)
        @data_lines << data_line
      end
    end
  end
end
