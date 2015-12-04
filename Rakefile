require 'rake/testtask'
require 'hoe'

Hoe.plugin :gemspec
Hoe.plugin :bundler

Hoe.spec 'eventmachinealignedperiodic' do
    developer("James FitzGibbon", "james@nadt.net")
    developer("Gregory Hill", "gregoryhilluk@gmail.com")
    license "MIT"
    dependency 'eventmachine', '~> 1.0.3'
    dependency 'hoe', '~> 3.7.1', :dev
    dependency 'hoe-gemspec', '~> 1.0.0', :dev
    dependency 'hoe-bundler', '~> 1.2.0', :dev
    dependency 'simplecov', '~> 0.7.1', :dev
    dependency 'simplecov-console', '~> 0.1.1', :dev
    dependency 'minitest', '~> 5.0.8', :dev
    dependency 'minitest-debugger', '~> 1.0.2', :dev
end

task :default => [:unit_tests]

task :package => [ 'gem:spec', 'bundler:gemfile' ]

desc "Run basic tests"
Rake::TestTask.new("unit_tests") { |t|
    t.libs.push 'lib'
    t.libs.push 'test'
    t.pattern = 'test/test_*.rb'
    t.verbose = true
    t.warning = false
}
