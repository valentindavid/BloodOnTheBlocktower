tag @e[type=#clock:player,tag=clock.marked] remove clock.marked
scoreboard players operation #clock:max-votes clock.votes = @s clock.votes
tag @s add clock.marked
tellraw @a ["", {"selector": "@s"}, " is marked for execution!"]
title @a clear
title @a subtitle "was marked for execution"
title @a title ["", {"selector": "@s"}]
function clock:ding-at with storage clock:positions bell
