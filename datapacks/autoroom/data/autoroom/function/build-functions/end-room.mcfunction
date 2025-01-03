$execute store result score #autoroom:$(room).dx autoroom.num run data get entity @s Pos[0]
$execute store result score #autoroom:$(room).dy autoroom.num run data get entity @s Pos[1]
$execute store result score #autoroom:$(room).dz autoroom.num run data get entity @s Pos[2]
$scoreboard players operation #autoroom:$(room).dx autoroom.num -= #autoroom:$(room).x autoroom.num
$scoreboard players operation #autoroom:$(room).dy autoroom.num -= #autoroom:$(room).y autoroom.num
$scoreboard players operation #autoroom:$(room).dz autoroom.num -= #autoroom:$(room).z autoroom.num

$execute unless data storage autoroom:rooms room.$(room).name run data modify storage autoroom:rooms all-rooms append value $(room)
$data modify storage autoroom:rooms room.$(room).name set value $(room)
$execute store result storage autoroom:rooms room.$(room).x int 1.0 run scoreboard players get #autoroom:$(room).x autoroom.num
$execute store result storage autoroom:rooms room.$(room).y int 1.0 run scoreboard players get #autoroom:$(room).y autoroom.num
$execute store result storage autoroom:rooms room.$(room).z int 1.0 run scoreboard players get #autoroom:$(room).z autoroom.num
$execute store result storage autoroom:rooms room.$(room).dx int 1.0 run scoreboard players get #autoroom:$(room).dx autoroom.num
$execute store result storage autoroom:rooms room.$(room).dy int 1.0 run scoreboard players get #autoroom:$(room).dy autoroom.num
$execute store result storage autoroom:rooms room.$(room).dz int 1.0 run scoreboard players get #autoroom:$(room).dz autoroom.num

$persistentgroup remove autoroom.$(room)
$persistentgroup add autoroom.$(room) isolated true

kill @s
