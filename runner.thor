require 'thor'
require_relative 'log_parser/parser'

class App < Thor

  desc 'parse PATH', 'parse file by PATH'
  def parse(path = File.join(File.dirname(__FILE__), 'sample/webserver.log'))
    puts LogParser::Parser.new.parse(path)
  end
end

class Tests < Thor
  desc 'all', 'run rspec and tests'
  def all
    puts %x[bundle exec rspec]
    puts %x[bundle exec rake test]
  end

  desc 'rspec', 'run rspec'
  def rspec
    puts %x[bundle exec rspec]
  end

  desc 'test', 'run tests'
  def test
    puts %x[bundle exec rake test]
  end
end
