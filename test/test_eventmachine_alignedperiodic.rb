require 'minitest_helper'

# Tests EventMachineAlignedPeriodic
class TestEVMAAlignedPeriodic < Minitest::Test
  def test_constructor
    aligned = EventMachine::AlignedPeriodic.new(900, proc { puts 'foo' })
    assert_instance_of EventMachine::AlignedPeriodic, aligned, 'constructor works'
  end
end
