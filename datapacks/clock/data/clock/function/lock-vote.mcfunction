$execute as @e[type=#clock:player,tag=clock.nominated] if data storage clock:votes {$(player):true} run function clock:finish-vote
$execute as @e[type=#clock:player,tag=clock.nominated] if data storage clock:votes {$(player):false} run function clock:finish-vote
$execute if data storage clock:votes {$(player):true} run return 1
$execute if data storage clock:votes {$(player):false} run return 1

$data modify storage clock:positions vote-lights.current set from storage clock:positions vote-lights.$(next)
$data modify storage clock:positions vote-lights.current.player set value $(next)

execute if block ~ ~1 ~ minecraft:redstone_lamp run schedule function clock:lock-vote-next 1s
execute if block ~ ~1 ~ minecraft:sea_lantern run schedule function clock:lock-vote-next 1s
execute if block ~ ~1 ~ minecraft:oxidized_copper run schedule function clock:lock-vote-next 1s
execute if block ~ ~1 ~ minecraft:netherite_block run schedule function clock:lock-vote-next 1

execute unless block ~ ~1 ~ minecraft:netherite_block unless block ~ ~1 ~ minecraft:air run playsound minecraft:block.piston.contract block @a ~ ~ ~ 6

$execute if block ~ ~1 ~ minecraft:redstone_lamp[lit=true] run data modify storage clock:votes $(player) set value true
$execute if block ~ ~1 ~ minecraft:redstone_lamp[lit=false] run data modify storage clock:votes $(player) set value false
$execute if block ~ ~1 ~ minecraft:sea_lantern run data modify storage clock:votes $(player) set value true

$execute if block ~ ~1 ~ minecraft:oxidized_copper run data modify storage clock:votes $(player) set value false
$execute if block ~ ~1 ~ minecraft:netherite_block run data modify storage clock:votes $(player) set value false

execute if block ~ ~1 ~ minecraft:redstone_lamp[lit=true] run scoreboard players add @e[type=#clock:player,tag=clock.nominated] clock.votes 1
execute if block ~ ~1 ~ minecraft:sea_lantern run scoreboard players add @e[type=#clock:player,tag=clock.nominated] clock.votes 1

execute if block ~ ~1 ~ minecraft:redstone_lamp run scoreboard players add @e[type=#clock:player,tag=clock.nominated] clock.alive-voters 1

execute if block ~ ~1 ~ minecraft:redstone_lamp[lit=true] run setblock ~ ~1 ~ minecraft:air
execute if block ~ ~1 ~ minecraft:redstone_lamp[lit=false] run setblock ~ ~1 ~ minecraft:air
execute if block ~ ~1 ~ minecraft:sea_lantern run setblock ~ ~1 ~ minecraft:air
execute if block ~ ~1 ~ minecraft:oxidized_copper run setblock ~ ~1 ~ minecraft:air
execute if block ~ ~1 ~ minecraft:netherite_block run setblock ~ ~1 ~ minecraft:air

$execute if data storage clock:votes {$(player):true} run tellraw @a ["", {"selector": "@e[type=#clock:player,tag=clock.$(player)]"}, " has voted for ", {"selector": "@e[type=#clock:player,tag=clock.nominated]"}]

$execute if data storage clock:votes {$(player):true} if entity @e[type=#clock:player,tag=clock.$(player),tag=!clock.dead] run setblock ~ ~ ~ minecraft:redstone_lamp[lit=true]
$execute if data storage clock:votes {$(player):true} if entity @e[type=#clock:player,tag=clock.$(player),tag=clock.dead,tag=!clock.dead-voted] run setblock ~ ~ ~ minecraft:sea_lantern

$execute if data storage clock:votes {$(player):false} if entity @e[type=#clock:player,tag=clock.$(player),tag=!clock.dead] run setblock ~ ~ ~ minecraft:redstone_lamp[lit=false]
$execute if data storage clock:votes {$(player):false} if entity @e[type=#clock:player,tag=clock.$(player),tag=clock.dead,tag=!clock.dead-voted] run setblock ~ ~ ~ minecraft:oxidized_copper

$execute if entity @e[type=#clock:player,tag=clock.$(player),tag=clock.dead,tag=clock.dead-voted] run setblock ~ ~ ~ minecraft:netherite_block
$execute unless entity @e[type=#clock:player,tag=clock.$(player)] run setblock ~ ~ ~ minecraft:netherite_block

$execute if data storage clock:votes {$(player):true} if entity @e[type=#clock:player,tag=clock.$(player),tag=clock.dead,tag=!clock.dead-voted] run tag @e[type=#clock:player,tag=clock.$(player)] add clock.dead-voted
