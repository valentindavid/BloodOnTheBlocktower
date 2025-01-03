execute as @e[type=#clock:player] if score @s clock.deaths matches 1.. run function clock:kill-player

kill @e[type=item,nbt={Item:{id:"minecraft:anvil"}}]

execute as @e[type=#clock:player,tag=clock.nominated,tag=!clock.marked] positioned as @s anchored eyes run particle minecraft:trial_omen ^ ^ ^
execute as @e[type=#clock:player,tag=clock.marked] positioned as @s anchored eyes run particle minecraft:raid_omen ^ ^ ^

execute as @e[gamemode=creative,nbt=!{Inventory:[{components:{'minecraft:item_name':'"clock.command-book"'}}]}] run function clock:get-command-book

stopsound @a music
