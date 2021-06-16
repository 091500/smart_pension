# frozen_string_literal: true

require_relative 'smart_pension/log_parser'

SmartPension::LogParser.new.parse(puts_enabled: true)
