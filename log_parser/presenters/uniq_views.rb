# frozen_string_literal: true

require_relative 'base'

module LogParser
  module Presenters
    # presents page views
    class UniqViews < Base
      # returns formatted data
      def show
        data.map { |key, value| "#{key} #{value.count} unique views" }.join("\n")
      end
    end
  end
end
