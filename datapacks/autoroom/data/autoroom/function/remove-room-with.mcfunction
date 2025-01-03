$execute unless data storage autoroom:rooms room.$(name){name: $(to_remove)} run return 1
$data remove storage autoroom:rooms all-rooms[$(index)]
$data remove storage autoroom:rooms room.$(name)
$data remove storage autoroom:rooms marker.$(name)
data modify storage autoroom:removing current-room.removed set value true
$persistentgroup remove autoroom.$(name)
