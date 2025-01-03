bossbar set timer:timer visible true
bossbar set timer:timer players @a
$bossbar set timer:timer max $(seconds)
$bossbar set timer:timer value $(seconds)
$scoreboard players set #timer:timer timer.num $(seconds)
function timer:update-timer
