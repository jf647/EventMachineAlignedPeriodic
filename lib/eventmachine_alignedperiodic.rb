require 'eventmachine'
require 'date'
require 'thread'

module EventMachine

    class AlignedPeriodic
    
        attr_reader :nextevent

        def initialize(interval, p, offset = 0, logger = nil)
            @interval = interval
            @offset = offset
            @p = p
            @logger = logger
            @partial = true
            @running = false
            @mutex = Mutex.new
        end

        def start
            @mutex.synchronize {
                EventMachine.add_shutdown_hook { @p.call(true) }
                @running = true
                schedule_first_event
            }
        end

        def poke
            @mutex.synchronize {
                # if we aren't running, we can't be poked
                unless @running
                    raise "periodic schedulder not running; can't be poked"
                end
                EventMachine.cancel_timer(@timer)
                @p.call(true)
                @partial = true
                schedule_next_event
            }
        end
        
        def stop
            @mutex.synchronize {
                EventMachine.cancel_timer(@timer)
                @running = false
                @p.call(true)
            }
        end
        
        private
        
        def do_periodic
            @mutex.synchronize {
                # we can't remove shutdown hooks, so if we aren't running, do nothing
                return unless @running
                begin
                    @p.call(@partial)
                rescue => e
                    if ! @logger.nil?
                        @logger.debug("exception in do_periodic: #{e}")
                    end
                end
                @partial = false if @partial
                @lastevent = @nextevent
                schedule_next_event
                if ! @logger.nil?
                    @logger.debug("next event is at @nextevent")
                end
            }
        end
        
        def schedule_first_event
            now = Time.now
            if @lastevent.nil?
                @lastevent = now.to_date.to_time + @offset
                while @lastevent + @interval < now
                    @lastevent += @interval
                end
            end
            @nextevent = @lastevent + @interval
            schedule
        end
        
        def schedule_next_event
            @nextevent = @lastevent + @interval
            schedule
        end
        
        def schedule
            nextevent_in = @nextevent - Time.now
            @timer = EventMachine.add_timer(nextevent_in) { do_periodic() }
        end
    
    end

end
