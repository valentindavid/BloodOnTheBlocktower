# Timer datapack

This shows a boss bar with a time decrementing.

Call `function timer:set-timer {seconds: 300}` for example for a 300
seconds timer.

When the timer runs out, function tagged `#timer:timeout` will be
called.
