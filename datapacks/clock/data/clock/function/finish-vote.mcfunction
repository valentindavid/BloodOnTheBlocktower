scoreboard players operation @s clock.needed-votes = @s clock.alive-voters
scoreboard players add @s clock.needed-votes 1
scoreboard players operation @s clock.needed-votes /= #clock:two clock.num

tellraw @a ["", {"selector":"@s"}, " got ", {"score":{"name":"@s","objective":"clock.votes"}}, " votes. ", {"score":{"name":"@s","objective":"clock.needed-votes"}}, " were needed."]

tag @s remove clock.nominated

execute if score @s clock.votes >= @s clock.needed-votes if score @s clock.votes = #clock:max-votes clock.votes run function clock:cancel-execution
execute if score @s clock.votes >= @s clock.needed-votes if score @s clock.votes > #clock:max-votes clock.votes run function clock:mark-for-execution
