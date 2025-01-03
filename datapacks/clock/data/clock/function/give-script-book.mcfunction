clear @s minecraft:written_book[item_name="clock.script-book"]
execute at @s run summon minecraft:item ^ ^ ^ {Item:{id:'minecraft:written_book'},PickupDelay:-1,Tags:['clock.copied-book']}
data modify entity @e[tag=clock.copied-book,limit=1] Item.components merge from storage clock:script book.components
data modify entity @e[tag=clock.copied-book,limit=1] Owner set from entity @s UUID
data modify entity @e[tag=clock.copied-book,limit=1] PickupDelay set value 0
tag @e[tag=clock.copied-book] remove clock.copied-book
