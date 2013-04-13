eventmachine_alignedperiodic Change Log
=======================================

2.1.0 (April 13 2013)
---------------------

* add a fourth arg to the constructor, an optional logger that must respond to #debug.  If provided, it logs exceptions in the periodic scheduler and the time of the next event after scheduling

2.0.1 (April 7 2013)
--------------------

* use thread mutex in periodic caller as well

2.0.0 (April 4 2013)
--------------------

* changed invocation style.  You now call start on the object rather than runner.go
* added poke method to kick off the periodic event outside of normal times. Note that attempting to poke when the periodic scheduler is not running throws an exception
* added stop method to stop event scheduling.  This calls the periodic event one last time with a true arg
* protected public methods with a thread mutex
* made private that which should be private
* added an reader :nextevent with the time the next event should kick off
* fixed arg to periodic event: should always reflect whether the method represents a full period or not

1.0.0 (March 15 2013)
---------------------

* initial version released on Github
