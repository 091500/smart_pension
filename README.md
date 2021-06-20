# README

[![CircleCI](https://circleci.com/gh/091500/sp/tree/master.svg?style=shield&circle-token=032beab1c56ce78a5bb2f5e6e2c12ef06a1ff190)](https://circleci.com/gh/091500/sp/tree/master)

[![codecov](https://codecov.io/gh/091500/sp/branch/master/graph/badge.svg?token=LHM6DQDJ8P)](https://codecov.io/gh/091500/sp)

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
2) run the following command: `ruby parser.rb sample/webserver.log`  
where _sample/webserver.log_ is a path to the log file

_webserver.log_ sample is located in the sample folder 

# How to run specs
1) cd to the project folder
2) run the following command: `bundle exec rspec`  

# How to run tests
1) cd to the project folder
2) run the following command: `bundle exec rake test`  

# How to generate docs
1) cd to the project folder
2) run the following command: `bundle exec rake rerdoc`  

# THOR
Thor is a command line tool for executing commands.  
List of available commands:  
1) cd to the project folder
2) run the following command: `thor list`  


> thor app:parse PATH  # parse file by PATH   
> thor tests:all    # run rspec and tests   
> thor tests:rspec  # run rspec   
> thor tests:test   # run tests   


# Approach description
`parser.rb` is an entry point of the app.
All app logic is located in _LogParser_ namespace.      
_ReaderInitializer_ is responsible for determine what type of reader to use.  
Currently, only FileReader is implemented. It reads a file for the provided path and
parses each line as a new LogEntry instance. After all data is read, it is passed to 
the UniqPages and UniqViews presenters. Before passing data it is sorted using ResultEntry 
query object call.  
      
# Possible Improvements (ideas)
- Add new readers: HttpReader, StringReader, etc.   
- Improve docs

# Output example
`ruby parser.rb sample/webserver.log`  

> Page views, sort order desc:   
> /about/2 90 visits   
> /contact 89 visits   
> /index 82 visits   
> /about 81 visits   
> /help_page/1 80 visits   
> /home 78 visits   
> Uniq page visits, sort order desc:   
> /index 23 unique views   
> /home 23 unique views   
> /contact 23 unique views   
> /help_page/1 23 unique views   
> /about/2 22 unique views   
> /about 21 unique views   
