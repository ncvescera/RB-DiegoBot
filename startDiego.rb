#!/usr/bin/ruby

require 'daemons'
require 'rubygems'

current_dir = Dir.pwd


options = {
  :backtrace => true,
  :app_name => "test",
  :log_dir => "#{current_dir}/log",
  :log_output => true,
  :dir_mode => :normal,
  :monitor => true
}

Daemons.run('diego.rb')
