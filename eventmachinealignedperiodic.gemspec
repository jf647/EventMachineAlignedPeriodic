# -*- encoding: utf-8 -*-
# stub: eventmachinealignedperiodic 2.1.1.20140729171927 ruby lib

Gem::Specification.new do |s|
  s.name = "eventmachinealignedperiodic"
  s.version = "2.1.1.20140729171927"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["James FitzGibbon"]
  s.date = "2014-07-30"
  s.description = "EventMachineAlignedPeriodic helps to kick off a block of code on a periodic\nschedule aligned with a time period.  Rather than have something starting at\n2 seconds, 17 seconds, 32 seconds and so on you can have it consistently\nlaunch at 0, 15, 30."
  s.email = ["james@nadt.net"]
  s.extra_rdoc_files = ["History.txt", "LICENSE.txt", "Manifest.txt", "README.txt", "History.txt"]
  s.files = [".gemtest", "History.txt", "LICENSE.txt", "Manifest.txt", "README.txt", "Rakefile", "eventmachinealignedperiodic.gemspec", "lib/eventmachine_alignedperiodic.rb", "test/test_eventmachine_alignedperiodic.rb"]
  s.homepage = "https://github.com/jf647/EventMachineAlignedPeriodic"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--title", "TestEventmachinealignedperiodic Documentation", "--quiet"]
  s.rubyforge_project = "eventmachinealignedperiodic"
  s.rubygems_version = "2.2.2"
  s.summary = "EventMachineAlignedPeriodic helps to kick off a block of code on a periodic schedule aligned with a time period"
  s.test_files = ["test/test_eventmachine_alignedperiodic.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<eventmachine>, ["~> 1.0"])
      s.add_development_dependency(%q<hoe-yard>, [">= 0.1.2"])
      s.add_development_dependency(%q<hoe>, ["~> 3.7"])
      s.add_development_dependency(%q<hoe-gemspec>, ["~> 1.0"])
      s.add_development_dependency(%q<hoe-bundler>, ["~> 1.2"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.7"])
      s.add_development_dependency(%q<simplecov-rcov>, ["~> 0.2"])
      s.add_development_dependency(%q<minitest>, ["~> 5.0"])
      s.add_development_dependency(%q<minitest-reporters>, ["~> 1.0"])
      s.add_development_dependency(%q<rubocop>, ["~> 0.24"])
      s.add_development_dependency(%q<flog>, ["~> 4.3"])
    else
      s.add_dependency(%q<eventmachine>, ["~> 1.0"])
      s.add_dependency(%q<hoe-yard>, [">= 0.1.2"])
      s.add_dependency(%q<hoe>, ["~> 3.7"])
      s.add_dependency(%q<hoe-gemspec>, ["~> 1.0"])
      s.add_dependency(%q<hoe-bundler>, ["~> 1.2"])
      s.add_dependency(%q<simplecov>, ["~> 0.7"])
      s.add_dependency(%q<simplecov-rcov>, ["~> 0.2"])
      s.add_dependency(%q<minitest>, ["~> 5.0"])
      s.add_dependency(%q<minitest-reporters>, ["~> 1.0"])
      s.add_dependency(%q<rubocop>, ["~> 0.24"])
      s.add_dependency(%q<flog>, ["~> 4.3"])
    end
  else
    s.add_dependency(%q<eventmachine>, ["~> 1.0"])
    s.add_dependency(%q<hoe-yard>, [">= 0.1.2"])
    s.add_dependency(%q<hoe>, ["~> 3.7"])
    s.add_dependency(%q<hoe-gemspec>, ["~> 1.0"])
    s.add_dependency(%q<hoe-bundler>, ["~> 1.2"])
    s.add_dependency(%q<simplecov>, ["~> 0.7"])
    s.add_dependency(%q<simplecov-rcov>, ["~> 0.2"])
    s.add_dependency(%q<minitest>, ["~> 5.0"])
    s.add_dependency(%q<minitest-reporters>, ["~> 1.0"])
    s.add_dependency(%q<rubocop>, ["~> 0.24"])
    s.add_dependency(%q<flog>, ["~> 4.3"])
  end
end
