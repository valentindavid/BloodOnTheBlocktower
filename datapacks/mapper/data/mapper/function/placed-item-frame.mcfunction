advancement revoke @s only mapper:placed-item-frame

execute if entity @s[y_rotation=-45..] as @e[type=minecraft:item_frame,tag=mapper.replace-me] run data modify entity @s Item.components.'minecraft:custom_data'.'mapper:params' merge value {facing: south, backing: north}
execute if entity @s[y_rotation=..45] as @e[type=minecraft:item_frame,tag=mapper.replace-me] run data modify entity @s Item.components.'minecraft:custom_data'.'mapper:params' merge value {facing: south, backing: north}
execute if entity @s[y_rotation=45..135] as @e[type=minecraft:item_frame,tag=mapper.replace-me] run data modify entity @s Item.components.'minecraft:custom_data'.'mapper:params' merge value {facing: west, backing: east}
execute if entity @s[y_rotation=135..] as @e[type=minecraft:item_frame,tag=mapper.replace-me] run data modify entity @s Item.components.'minecraft:custom_data'.'mapper:params' merge value {facing: north, backing: south}
execute if entity @s[y_rotation=-135] as @e[type=minecraft:item_frame,tag=mapper.replace-me] run data modify entity @s Item.components.'minecraft:custom_data'.'mapper:params' merge value {facing: north, backing: south}
execute if entity @s[y_rotation=-135..-45] as @e[type=minecraft:item_frame,tag=mapper.replace-me] run data modify entity @s Item.components.'minecraft:custom_data'.'mapper:params' merge value {facing: east, backing: west}

execute as @e[type=minecraft:item_frame,tag=mapper.replace-me] at @s run function mapper:call-build-function with entity @s Item.components.'minecraft:custom_data'.'mapper:function'
