require 'rake/testtask'
require 'rubocop/rake_task'
require 'hoe'

Hoe.plugin :gemspec
Hoe.plugin :bundler
Hoe.plugin :yard
Hoe.plugins.delete :flog

Hoe.spec 'eventmachinealignedperiodic' do
  developer('James FitzGibbon', 'james@nadt.net')
  license 'MIT'
  dependency 'eventmachine', '~> 1.0'
  dependency 'hoe', '~> 3.7', :dev
  dependency 'hoe-gemspec', '~> 1.0', :dev
  dependency 'hoe-bundler', '~> 1.2', :dev
  dependency 'hoe-yard', '~> 0.1', :dev
  dependency 'simplecov', '~> 0.7', :dev
  dependency 'simplecov-rcov', '~> 0.2', :dev
  dependency 'minitest', '~> 5.0', :dev
  dependency 'minitest-reporters', '~> 1.0', :dev
  dependency 'rubocop', '~> 0.24', :dev
  dependency 'flog', '~> 4.3', :dev
end

desc 'Generate coverage report'
task coverage: [:coverage_env, :test]

task :coverage_env do
  ENV['COVERAGE'] = 'true'
end

RuboCop::RakeTask.new(:style) do |task|
  task.patterns = ['Rakefile', 'lib/**/*.rb', 'test/**/*.rb']
  task.fail_on_error = true if ENV['CI_BUILD']
end

require 'flog_task'
FlogTask.new('flog', 200, %w(lib)) do |task|
  task.verbose = true
end
