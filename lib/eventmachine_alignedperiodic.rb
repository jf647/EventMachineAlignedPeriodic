require 'eventmachine'
require 'date'
require 'thread'

module EventMachine
  # a plugin for EventMachine to fire an event aligned to a fixed period
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
      @mutex.synchronize do
        EventMachine.add_shutdown_hook { @p.call(true) }
        @running = true
        schedule_first_event
      end
    end

    def poke
      @mutex.synchronize do
        # if we aren't running, we can't be poked
        fail "periodic schedulder not running; can't be poked" unless @running
        EventMachine.cancel_timer(@timer)
        @p.call(true)
        @partial = true
        schedule_next_event
      end
    end

    def stop
      @mutex.synchronize do
        EventMachine.cancel_timer(@timer)
        @running = false
        @p.call(true)
      end
    end

    private

    def do_periodic
      @mutex.synchronize do
        # we can't remove shutdown hooks, so if we aren't running, do nothing
        return unless @running
        begin
          @p.call(@partial)
      rescue => e
        @logger.nil? || @logger.debug("exception in do_periodic: #{e}")
        end
        @partial = false if @partial
        @lastevent = @nextevent
        schedule_next_event
      end
    end

    def schedule_first_event
      now = Time.now
      if @lastevent.nil?
        @lastevent = now.to_date.to_time + @offset
        @lastevent += @interval while @lastevent + @interval < now
      end
      @nextevent = @lastevent + @interval
      schedule
    end

    def schedule_next_event
      @nextevent = @lastevent + @interval
      schedule
    end

    def schedule
      @logger.nil? || @logger.debug("next event is at #{@nextevent}")
      nextevent_in = @nextevent - Time.now
      @timer = EventMachine.add_timer(nextevent_in) { do_periodic }
    end
  end
end
