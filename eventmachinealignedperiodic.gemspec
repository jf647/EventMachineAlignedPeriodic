# -*- encoding: utf-8 -*-
# stub: eventmachinealignedperiodic 2.1.2.20151204094310 ruby lib

Gem::Specification.new do |s|
  s.name = "eventmachinealignedperiodic"
  s.version = "2.1.2.20151204094310"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["James FitzGibbon", "Gregory Hill"]
  s.date = "2015-12-04"
  s.description = "EventMachineAlignedPeriodic helps to kick off a block of code on a periodic\nschedule aligned with a time period.  Rather than have something starting at\n2 seconds, 17 seconds, 32 seconds and so on you can have it consistently\nlaunch at 0, 15, 30."
  s.email = ["james@nadt.net", "gregoryhilluk@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "LICENSE.txt", "Manifest.txt", "README.md"]
  s.files = [".gemtest", "History.txt", "LICENSE.txt", "Manifest.txt", "README.md", "Rakefile", "eventmachinealignedperiodic.gemspec", "lib/eventmachine_alignedperiodic.rb", "test/test_eventmachine_alignedperiodic.rb"]
  s.homepage = "https://github.com/jf647/EventMachineAlignedPeriodic"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.md"]
  s.rubyforge_project = "eventmachinealignedperiodic"
  s.rubygems_version = "2.4.6"
  s.summary = "EventMachineAlignedPeriodic helps to kick off a block of code on a periodic schedule aligned with a time period"
  s.test_files = ["test/test_eventmachine_alignedperiodic.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<eventmachine>, ["~> 1.0.3"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<hoe>, ["~> 3.7.1"])
      s.add_development_dependency(%q<hoe-gemspec>, ["~> 1.0.0"])
      s.add_development_dependency(%q<hoe-bundler>, ["~> 1.2.0"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.7.1"])
      s.add_development_dependency(%q<simplecov-console>, ["~> 0.1.1"])
      s.add_development_dependency(%q<minitest>, ["~> 5.0.8"])
      s.add_development_dependency(%q<minitest-debugger>, ["~> 1.0.2"])
    else
      s.add_dependency(%q<eventmachine>, ["~> 1.0.3"])
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<hoe>, ["~> 3.7.1"])
      s.add_dependency(%q<hoe-gemspec>, ["~> 1.0.0"])
      s.add_dependency(%q<hoe-bundler>, ["~> 1.2.0"])
      s.add_dependency(%q<simplecov>, ["~> 0.7.1"])
      s.add_dependency(%q<simplecov-console>, ["~> 0.1.1"])
      s.add_dependency(%q<minitest>, ["~> 5.0.8"])
      s.add_dependency(%q<minitest-debugger>, ["~> 1.0.2"])
    end
  else
    s.add_dependency(%q<eventmachine>, ["~> 1.0.3"])
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<hoe>, ["~> 3.7.1"])
    s.add_dependency(%q<hoe-gemspec>, ["~> 1.0.0"])
    s.add_dependency(%q<hoe-bundler>, ["~> 1.2.0"])
    s.add_dependency(%q<simplecov>, ["~> 0.7.1"])
    s.add_dependency(%q<simplecov-console>, ["~> 0.1.1"])
    s.add_dependency(%q<minitest>, ["~> 5.0.8"])
    s.add_dependency(%q<minitest-debugger>, ["~> 1.0.2"])
  end
end
