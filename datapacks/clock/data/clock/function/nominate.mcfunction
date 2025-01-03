$tag @e[type=#clock:player,tag=clock.nominated,tag=!clock.$(player)] remove clock.nominated
$tag @e[type=#clock:player,tag=clock.$(player)] add clock.nominated
function clock:vine-boom-at with storage clock:positions bell
$tellraw @a ["", {"selector": "@e[type=#clock:player,tag=clock.$(player)]"}, " was nominated!"]
title @a clear
title @a subtitle "was nominated"
$title @a title ["", {"selector": "@e[type=#clock:player,tag=clock.$(player)]"}]
function clock:reset-votes
