require 'eventmachine'
require 'date'

module EventMachine

    class AlignedPeriodic

        def initialize(interval, p, offset = 0)
            @interval = interval
            @offset = offset
            @p = p
        end

        def go
            calc_next_event()
            nextevent_in = @nextevent - Time.now
            EventMachine.add_timer(nextevent_in) { do_periodic() }
            EventMachine.add_shutdown_hook { @p.call(true) }
        end

        def do_periodic
            @p.call(false)
            @lastevent = @nextevent
            calc_next_event()
            nextevent_in = @nextevent - Time.now
            EventMachine.add_timer(nextevent_in) { do_periodic() }
        end

        def calc_next_event
            now = Time.now
            if @lastevent.nil?
                @lastevent = now.to_date.to_time + @offset
                while @lastevent + @interval < now
                    @lastevent += @interval
                end
            end
            @nextevent = @lastevent + @interval
        end
    
    end

end
