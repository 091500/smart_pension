# frozen_string_literal: true

require_relative 'base'

module LogParser
  module Presenters
    # presents page visits
    class UniqPages < Base
      # returns formatted data
      def show
        @data.map { |key, value| "#{key} #{value.count} visits" }.join("\n")
      end
    end
  end
end
