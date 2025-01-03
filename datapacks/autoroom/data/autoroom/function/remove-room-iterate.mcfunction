$scoreboard players set #autoroom:remove.loop autoroom.num $(current)
execute store result score #autoroom:remove.len autoroom.num run data get storage autoroom:rooms all-rooms
execute if score #autoroom:remove.loop autoroom.num >= #autoroom:remove.len autoroom.num run return 1

$data modify storage autoroom:removing current-room.name set from storage autoroom:rooms all-rooms[$(current)]
$data modify storage autoroom:removing current-room.index set value $(current)
$data modify storage autoroom:removing current-room.to_remove set value $(room)
data remove storage autoroom:removing current-room.removed

function autoroom:remove-room-with with storage autoroom:removing current-room

execute unless data storage autoroom:removing current-room.removed run scoreboard players add #autoroom:remove.loop autoroom.num 1
execute store result storage autoroom:removing next.current int 1.0 run scoreboard players get #autoroom:remove.loop autoroom.num

function autoroom:remove-room-iterate with storage autoroom:removing next
