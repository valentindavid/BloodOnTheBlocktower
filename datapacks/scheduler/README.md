# Scheduler

This is a mini data pack for Minecraft that provides a half second and
full second call for functions that needs to be called often, but
every tick would be too much.

Set your function to function tag #scheduler:halfsecond or
#scheduler:halfsecond, and this function will be called every half
second.

Eventually in an `execute` command, you can use condition `if score
#scheduler:halfsecond scheduler.ticks matches 0` to trigger only every
half second.
