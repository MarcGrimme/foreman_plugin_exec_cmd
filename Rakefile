# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'
require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "foreman_plugin_exec_cmd"
  gem.homepage = "http://github.com/isratrade/foreman_plugin_template"
  gem.license = "GPL-3"
  gem.summary = %Q{Plugin for Foreman that executes a given command.}
  gem.description = %Q{Plugin for Foreman that executes a given command.}
  gem.email = "grimme( at )atix.de"
  gem.authors = ["Marc Grimme"]
  # dependencies defined in Gemfile
end

task :default => :test
