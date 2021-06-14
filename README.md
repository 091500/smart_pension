# README

[![CircleCI](https://circleci.com/gh/091500/smart_pension/tree/master.svg?style=shield&circle-token=032beab1c56ce78a5bb2f5e6e2c12ef06a1ff190)](https://circleci.com/gh/091500/smart_pension/tree/master)

[![codecov](https://codecov.io/gh/091500/smart_pension/branch/master/graph/badge.svg?token=9ZYO4MINZZ)](https://codecov.io/gh/091500/smart_pension)

# Task Description
This is a ruby app to parse data from a log file.  
It receives a log path as an argument and outputs sorted data:
- list of pages with page views count sorted by desc
- list of pages with unique views count sorted by desc   

In case of error - an error message is displayed.  
File name should be the following: _webserver.log_

# CI 
- CircleCi integration implemented
- CircleCi badge shows build status
- CodeCov integration implemented
- CodeCov badge shows code coverage percent


_CODECOV_TOKEN_ value is set in .env 

# How to install section
1) git checkout
2) bundle install

# How to run app
1) cd to the project folder
2) run the following command: `rails r app/parser.rb /tmp/smtest/test/webserver.log`  
where _/tmp/smtest/test/webserver.log_ is a full path to the log file

_webserver.log_ sample is located in the sample folder 

# How to run specs
1) cd to the project folder
2) run the following command: `rspec`  

# How to run tests
1) cd to the project folder
2) run the following command: `rails test`  

# How to generate docs
1) cd to the project folder
2) run the following command: `bundle exec rake rerdoc`  


# Approach description
`app/parser.rb` is an entry point of the app.
All app logic is located in _SmartPension_ namespace.      
_ReaderInitializer_ is responsible for determine what type of reader to use.  
Currently, only FileReader is implemented. It reads a file for the provided path and
parses each line as a new LogEntry instance. After all data is read, it is passed to 
the UniqPages and UniqViews presenters. Before passing data it is sorted using ResultEntry 
query object call.  
      
# Possible Improvements (ideas)
- Rails gem could be removed, since the app does not use db.   
- Add new readers: HttpReader, StringReader, etc.   
- Clean up unused gems
- Update used gems for latest versions

 
