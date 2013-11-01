#!/usr/bin/env ruby
BROWSER_COMMAND = 'google-chrome'
repo = `git remote -v | grep origin | grep push`.match(/(github.com:.*)\./)[1].gsub(":","/")
commits_path = "http://#{repo}/commit/"
commit_hash = ARGV.first
if commit_hash.nil?
  puts "missing commit hash"
else
  puts `#{BROWSER_COMMAND} #{commits_path + commit_hash}`
end
