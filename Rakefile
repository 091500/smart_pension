require 'rake/testtask'
require 'rdoc/task'

task default: %w[test]

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

RDoc::Task.new do |rdoc|
  rdoc.main = "README.rdoc"

  rdoc.rdoc_files.include("log_parser/**/*.rb")
  #change above to fit needs

  rdoc.title = "App Documentation"
  rdoc.options << "--all"
end
