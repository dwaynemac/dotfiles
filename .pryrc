require 'rubygems'
require '~/.irb/irb/gem_loader'
require '~/.irb/irb/pry_loader'
require '~/.irb/irb/custom' if File.exists?("#{Dir.home}/.irb/irb/custom.rb")
require '~/.irb/irb/awesome_print_loader'
require '~/.irb/irb/bypass_reloader'
require '~/.irb/irb/rails_env_switcher'
require '~/.irb/irb/rspec_console'
require '~/.irb/irb/cucumber_console'
require '~/.irb/irb/rails_colors'
# require '~/.irb/irb/mongoid_colors'
require '~/.irb/irb/plot'
require '~/.irb/irb/rails_commands'

Pry.config.editor = "vim"
