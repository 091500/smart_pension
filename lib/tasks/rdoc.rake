require 'rdoc/task'

RDoc::Task.new do |rdoc|
  rdoc.main = "README.rdoc"

  rdoc.rdoc_files.include("app/**/*.rb")
  #change above to fit needs

  rdoc.title = "App Documentation"
  rdoc.options << "--all"
end