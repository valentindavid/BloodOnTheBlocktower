$data modify storage autoroom:updating current-room-full set from storage autoroom:rooms room.$(name)
function autoroom:update-room-with with storage autoroom:updating current-room-full

$execute if score #scheduler:halfsecond scheduler.ticks matches 0 if entity @a[tag=autoroom.in-room-$(name)] run function autoroom:show-busy with storage autoroom:rooms marker.$(name).1
$execute if score #scheduler:halfsecond scheduler.ticks matches 0 if entity @a[tag=autoroom.in-room-$(name)] run function autoroom:show-busy with storage autoroom:rooms marker.$(name).2
$execute if score #scheduler:halfsecond scheduler.ticks matches 0 if entity @a[tag=autoroom.in-room-$(name)] run function autoroom:show-busy with storage autoroom:rooms marker.$(name).3
$execute if score #scheduler:halfsecond scheduler.ticks matches 0 if entity @a[tag=autoroom.in-room-$(name)] run function autoroom:show-busy with storage autoroom:rooms marker.$(name).4
