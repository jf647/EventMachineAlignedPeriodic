require 'minitest_helper'
require 'logger'

class TestEVMAAlignedPeriodic < Minitest::Test
  def test_constructor
    aligned = EventMachine::AlignedPeriodic.new(900, proc { puts "foo" })
    assert_instance_of EventMachine::AlignedPeriodic, aligned, "constructor works"
  end
  def test_destructor_trap_context
    aligned = EventMachine::AlignedPeriodic.new(900, proc { puts "foo" })
    assert_instance_of EventMachine::AlignedPeriodic, aligned, "constructor works"

    #This specifically tests stopping in a trap context.
    #Issue #418
    shutdownproc = Proc.new {
        aligned.stop
    }
    Signal.trap("TERM", shutdownproc)
    Process.kill("TERM", $$)
  end

  def test_destructor_reactor_not_running
    aligned = EventMachine::AlignedPeriodic.new(900, proc { puts "foo" })
    assert_instance_of EventMachine::AlignedPeriodic, aligned, "constructor works"
    out, err = capture_io do
      aligned.stop
    end
    assert_match "foo", out
  end

  def test_poke_not_running
    aligned = EventMachine::AlignedPeriodic.new(900, proc { puts "foo" })
    e = assert_raises(RuntimeError) { aligned.poke }
    assert_equal e.message, "periodic schedulder not running; can't be poked"
  end

  def test_poke_running
    aligned = nil
    t = nil
    out, err = capture_io {
      log = Logger.new($stdout)
      aligned = EventMachine::AlignedPeriodic.new(900, proc { puts "foo" },0,log)
      t = Thread.new() do
        EM.run
      end
      sleep 1  #pause to give eventmachine time to initialise
      aligned.start
    }
    assert_match %r{next event is at}, out
    out, err = capture_io { aligned.poke }
    assert_equal "foo\n", out
    aligned.stop
    EM.stop
    t.join
  end

  def test_periodic_output #no assertions yet but does run lines of code! :)
    log = Logger.new(STDOUT)
    aligned = EventMachine::AlignedPeriodic.new(5, proc { puts "foo" },0,log)
    t = Thread.new() do
      EM.run
    end
    sleep 1  #pause to give eventmachine time to initialise
    aligned.start
    sleep 5
    #assert_match "foo", out
    aligned.stop
    EM.stop
    t.join
  end
end
