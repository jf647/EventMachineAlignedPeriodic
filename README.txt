EventMachineAlignedPeriodic
===========================

Overview
--------

EventMachine helper to call a block on a periodic schedule with clock alignment.

Synopsis
--------

```ruby
require 'eventmachine'
require 'eventmachine_alignedperiodic'
require 'logger'

log = Logger.new(STDOUT)
log.level = Logger::DEBUG

periodic = EventMachine::AlignedPeriodic.new(interval, proc {
      |partial| do_something(partial)
}, offset, log)

def do_something(partial)
    puts "Yay! I just did something"
    if partial
        puts "... but only partially"
    end
end

EM.run {
    periodic.start
    puts "next event is at #{periodic.nextevent}"
    periodic.poke
    periodic.stop
}
```

Assuming that interval was 900 (15 minutes) and offset was 30, do_something will be called
at the next aligned 15 minute interval.  So if you started your program at 10:07:06, it would
be called at 10:15:30, then at 10:30:30, 10:45:30 and so on.

Clock resolution and EventMachine latency means that the proc is usually kicked off tens or
hundreds of microseconds after the interval.

The first time the proc is called and the last time (when the EventMachine loop shuts down) the
partial flag will be true.  Every other time it will be false.

Contributing to EventMachineAlignedPeriodic
-------------------------------------------
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the version or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.
