# frozen_string_literal: true

require 'simplecov'
require 'codecov'
require 'dotenv'

Dotenv.load

SimpleCov.start 'rails' do
  add_filter '/spec/'
  add_filter '/test/'
  add_filter 'parser.rb'
end

SimpleCov.formatter = SimpleCov::Formatter::Codecov
