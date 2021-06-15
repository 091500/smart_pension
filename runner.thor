require 'thor/rails'
require_relative 'app/services/smart_pension/log_parser'

class App < Thor
  include Thor::Rails

  desc 'parse PATH', 'parse file by PATH'
  def parse(path = File.join(File.dirname(__FILE__), 'sample/webserver.log'))
    puts SmartPension::LogParser.new.parse(path)
  end
end

class Tests < Thor
  include Thor::Rails

  desc 'all', 'run rspec and tests'
  def all
    puts %x[rspec]
    puts %x[rake test]
  end

  desc 'rspec', 'run rspec'
  def rspec
    puts %x[rspec]
  end

  desc 'test', 'run tests'
  def test
    puts %x[rake test]
  end
end
