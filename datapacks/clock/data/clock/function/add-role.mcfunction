$execute anchored eyes run summon minecraft:item ^ ^ ^1 {Tags: ["clock.role_token", "clock.role.$(role)"], PickupDelay:-1, Item:{id: "minecraft:paper", components:{item_model:"clock:role_token", item_name: '"Role token"', custom_data: {role: "$(role)"}}}}
$execute as @e[tag=clock.role_token,tag=clock.role.$(role)] run data modify entity @s Item.components merge from storage clock:roles $(role).components
$tellraw @s ["Added role ", {"storage": "clock:roles", "nbt": "$(role).name", "interpret": true}]
