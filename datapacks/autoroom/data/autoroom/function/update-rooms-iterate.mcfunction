$scoreboard players set #autoroom:room.loop autoroom.num $(current)
execute store result score #autoroom:room.len autoroom.num run data get storage autoroom:rooms all-rooms
execute if score #autoroom:room.loop autoroom.num >= #autoroom:room.len autoroom.num run return 1

$data modify storage autoroom:updating current-room.name set from storage autoroom:rooms all-rooms[$(current)]

function autoroom:update-room-with-name with storage autoroom:updating current-room

scoreboard players add #autoroom:room.loop autoroom.num 1
execute store result storage autoroom:updating next.current int 1.0 run scoreboard players get #autoroom:room.loop autoroom.num

function autoroom:update-rooms-iterate with storage autoroom:updating next
