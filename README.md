# EventMachineAlignedPeriodic

home :: https://github.com/jf647/EventMachineAlignedPeriodic

## SUMMARY:

EventMachine helper to call a block on a periodic schedule with clock alignment.

## DESCRIPTION

EventMachineAlignedPeriodic helps to kick off a block of code on a periodic
schedule aligned with a time period.  Rather than have something starting at
2 seconds, 17 seconds, 32 seconds and so on you can have it consistently
launch at 0, 15, 30.

## SYNOPSIS:

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

Assuming that interval was 900 (15 minutes) and offset was 30, do_something will be called
at the next aligned 15 minute interval.  So if you started your program at 10:07:06, it would
be called at 10:15:30, then at 10:30:30, 10:45:30 and so on.

Clock resolution and EventMachine latency means that the proc is usually kicked off tens or
hundreds of microseconds after the interval.

The first time the proc is called and the last time (when the EventMachine loop shuts down) the
partial flag will be true.  Every other time it will be false.

## LICENSE:

The MIT License (MIT)

Copyright (c) 2012, 2013 James FitzGibbon <james@nadt.net>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to
deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE.

## Contributing to EventMachineAlignedPeriodic
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the version or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.
