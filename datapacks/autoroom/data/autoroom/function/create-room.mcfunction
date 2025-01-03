scoreboard players add #autoroom:next-room autoroom.num 1
execute store result storage autoroom:current current.room int 1.0 run scoreboard players get #autoroom:next-room autoroom.num
function autoroom:create-room-nr with storage autoroom:current current
