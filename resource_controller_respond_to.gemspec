# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{resource_controller_respond_to}
  s.version = "0.0.1"
  
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.add_dependency('resources_controller', '>= 2.0.0')
  
  s.authors = ["jesperronn", "Averell"]
  s.date = %q{2008-11-08}
  s.description = %q{Extends ResourceController plugin for Rails to make it respond_to .xml and .json formats.}
  s.email = %q{mail@digineo.de}
  s.files = %W{
    ./tasks/resource_controller_respond_to_tasks.rake
    ./init.rb
    ./install.rb
    ./Rakefile
    ./lib/resource_controller_respond_to.rb
    ./test/resource_controller_respond_to_test.rb
    ./README
    ./MIT-LICENSE
    ./resource_controller_respond_to.gemspec
    ./uninstall.rb
  }
  s.has_rdoc = true
  s.homepage = %q{http://github.com/Averell/resource_controller_respond_to/tree/master}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{Extends ResourceController plugin for Rails to make it respond_to .xml and .json formats.}
end

