# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "foreman_plugin_exec_cmd"
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marc Grimme"]
  s.date = "2013-04-03"
  s.description = "Plugin for Foreman that executes a given command."
  s.email = "grimme( at )atix.de"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.homepage = "http://github.com/isratrade/foreman_plugin_template"
  s.licenses = ["GPL-3"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.11"
  s.summary = "Plugin for Foreman that executes a given command."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
#      s.add_development_dependency(%q<debugger>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
#      s.add_dependency(%q<debugger>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
#    s.add_dependency(%q<debugger>, [">= 0"])
  end
end

