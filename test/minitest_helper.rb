if ENV['COVERAGE']
    require 'simplecov'
    SimpleCov.start do
        add_filter 'vendor'
        add_filter 'test'
    end
end

require 'minitest/autorun'
require 'minitest/unit'
if ENV['CI']
    require 'minitest/reporters'
    Minitest::Reporters.use! Minitest::Reporters::JUnitReporter.new
end

require 'eventmachine_alignedperiodic'
