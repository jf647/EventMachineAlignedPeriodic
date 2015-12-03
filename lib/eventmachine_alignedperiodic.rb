require 'eventmachine'
require 'date'
require 'thread'

module EventMachine

    class AlignedPeriodic

        VERSION = '2.1.1'

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
            #Changed as per https://github.com/eventmachine/eventmachine/issues/418
            if EM.reactor_running?
              EM.add_timer(0) {
                  EventMachine.cancel_timer(@timer) if !@timer.nil?
              }
            end
            @running = false
            @timer = nil
            @p.call(true)
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
            if ! @logger.nil?
                @logger.debug("next event is at #{@nextevent}")
            end
            nextevent_in = @nextevent - Time.now
            @timer = EventMachine.add_timer(nextevent_in) { do_periodic() }
        end

    end

end
