require 'rake/testtask'
require 'rubocop/rake_task'
require 'hoe'

Hoe.plugin :gemspec
Hoe.plugin :bundler
Hoe.plugin :yard
Hoe.plugin :flog

Hoe.spec 'eventmachinealignedperiodic' do
    developer("James FitzGibbon", "james@nadt.net")
    license "MIT"
    dependency 'eventmachine', '~> 1.0.3'
    dependency 'hoe', '~> 3.7.1', :dev
    dependency 'hoe-gemspec', '~> 1.0.0', :dev
    dependency 'hoe-bundler', '~> 1.2.0', :dev
    dependency 'hoe-yard', '~> 0.1.2', :dev
    dependency 'simplecov', '~> 0.7.1', :dev
    dependency 'simplecov-rcov', '~> 0.2.3', :dev
    dependency 'minitest', '~> 5.0.8', :dev
    dependency 'minitest-reporters', '~> 1.0.4', :dev
    dependency 'rubocop', '~> 0.24.1', :dev
    dependency 'flog', '~> 4.3.0', :dev
end

task :package => [ 'gem:spec', 'bundler:gemfile' ]

desc "Generate coverage report"
task :coverage => [ :coverage_env, :test ]

task :coverage_env do
    ENV['COVERAGE'] = 'true'
end

Rake::TestTask.new("test") { |t|
    t.libs.push 'lib'
    t.libs.push 'test'
    t.pattern = 'test/test_*.rb'
    t.verbose = true
    t.warning = false
}

RuboCop::RakeTask.new(:style) do |task|
    if ENV['CI_BUILD']
        task.fail_on_error = true
    end
end
