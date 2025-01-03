$data modify storage clock:timepoints next set from storage clock:timepoints $(next)

$time set $(time)
title @a clear
$title @a subtitle "$(subtitle)"
$title @a title "$(title)"
function clock:ring
$scoreboard players set #clock:time clock.num $(time)

execute if score #clock:time clock.num matches 18000.. run function clock:wolf-at with storage clock:positions bell

$scoreboard players set #clock:time-next clock.num $(timer)
$execute if score #clock:time-next clock.num matches 1.. run function timer:set-timer {seconds: $(timer)}
$execute if score #clock:time-next clock.num matches 0 run function timer:remove-timer {seconds: $(timer)}

scoreboard players set #clock:max-votes clock.votes 0
tag @e[type=#clock:player,tag=clock.marked] remove clock.marked
tag @e[type=#clock:player,tag=clock.nominated] remove clock.nominated
