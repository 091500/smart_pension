# frozen_string_literal: true

require_relative 'log_parser/parser'

LogParser::Parser.new.parse(puts_enabled: true)
