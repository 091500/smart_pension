# frozen_string_literal: true

require_relative '../test_helper'
require 'minitest/autorun'
require_relative '../../smart_pension/log_parser'

class LogParserTest < Minitest::Test
  def test_parse_using_file_reader
    file_path = File.join(File.dirname(__FILE__), '../../spec/files/webserver.log').to_s

    expected = <<~EXP
      Page views, sort order desc:
      /help_page/1 4 visits
      /home 3 visits
      /contact 2 visits
      /help_page/2 1 visits
      /about 1 visits
      /index 1 visits
      /about/2 1 visits

      Uniq page visits, sort order desc:
      /help_page/1 4 unique views
      /home 2 unique views
      /help_page/2 1 unique views
      /about 1 unique views
      /index 1 unique views
      /about/2 1 unique views
      /contact 1 unique views
    EXP

    assert_equal(expected.strip, SmartPension::LogParser.new.parse(file_path))
  end
end
