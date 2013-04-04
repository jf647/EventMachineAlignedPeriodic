
require 'test/unit'
require 'eventmachine_alignedperiodic'

class TestEVMAAlignedPeriodic < Test::Unit::TestCase
    def test_constructor
        aligned = EventMachine::AlignedPeriodic.new(900, proc { puts "foo" })
        assert_instance_of EventMachine::AlignedPeriodic, aligned, "constructor works"
    end
end
