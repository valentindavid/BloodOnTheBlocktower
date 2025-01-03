tag @s add clock.role-picked
$data modify entity @s Owner set from entity @a[tag=clock.$(player),limit=1] UUID
data modify entity @s PickupDelay set value 0

$data modify storage clock:grimoire players.$(player).player set value $(player)
$data modify storage clock:grimoire players.$(player).role set from entity @s Item.components."minecraft:custom_data".role

$function clock:set-role-assignment with storage clock:grimoire players.$(player)

$teleport @s @e[type=#clock:player,tag=clock.$(player),limit=1]
