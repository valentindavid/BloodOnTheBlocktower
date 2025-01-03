$execute if entity @s[tag=!clock.dead] positioned $(lever_x) $(lever_y) $(lever_z) if block ~ ~ ~ minecraft:lever[powered=false] positioned $(x) $(y) $(z) unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:redstone_lamp[lit=false] run setblock ~ ~ ~ minecraft:redstone_lamp[lit=false]
$execute if entity @s[tag=!clock.dead] positioned $(lever_x) $(lever_y) $(lever_z) if block ~ ~ ~ minecraft:lever[powered=true] positioned $(x) $(y) $(z) unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:redstone_lamp[lit=true] run setblock ~ ~ ~ minecraft:redstone_lamp[lit=true]

$execute if entity @s[tag=clock.dead,tag=!clock.dead-voted] positioned $(lever_x) $(lever_y) $(lever_z) if block ~ ~ ~ minecraft:lever[powered=false] positioned $(x) $(y) $(z) unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:oxidized_copper run setblock ~ ~ ~ minecraft:oxidized_copper
$execute if entity @s[tag=clock.dead,tag=!clock.dead-voted] positioned $(lever_x) $(lever_y) $(lever_z) if block ~ ~ ~ minecraft:lever[powered=true] positioned $(x) $(y) $(z) unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:sea_lantern run setblock ~ ~ ~ minecraft:sea_lantern

$execute if entity @s[tag=clock.dead,tag=clock.dead-voted] positioned $(x) $(y) $(z) unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:netherite_block run setblock ~ ~ ~ minecraft:netherite_block

$execute positioned $(x) $(y) $(z) if block ~ ~ ~ minecraft:air positioned $(lever_x) $(lever_y) $(lever_z) if block ~ ~ ~ minecraft:lever run setblock ~ ~ ~ minecraft:air

$execute if entity @s[tag=clock.dead,tag=clock.dead-voted] positioned $(lever_x) $(lever_y) $(lever_z) if block ~ ~ ~ minecraft:lever run setblock ~ ~ ~ minecraft:air

$execute if entity @s[tag=!clock.dead] positioned $(x) $(y) $(z) unless block ~ ~ ~ minecraft:air positioned $(lever_x) $(lever_y) $(lever_z) if block ~ ~ ~ minecraft:air run setblock ~ ~ ~ minecraft:lever[facing=$(lever_facing),face=floor]
$execute if entity @s[tag=clock.dead,tag=!clock.dead-voted] positioned $(x) $(y) $(z) unless block ~ ~ ~ minecraft:air positioned $(lever_x) $(lever_y) $(lever_z) if block ~ ~ ~ minecraft:air run setblock ~ ~ ~ minecraft:lever[facing=$(lever_facing),face=floor]
